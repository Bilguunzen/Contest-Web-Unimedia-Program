require 'fileutils'

class SubmissionsController < ApplicationController
  before_action :set_submission, only: [:show]

  def index
    @submissions = Submission.all.order('created_at DESC')
  end

  def show
  end

  def new
    begin
      @contest = Contest.find(params[:id])
      @user = User.find(current_user.id)
    rescue 
      redirect_to '/error'
    end
    redirect_to '/error' if logged_in? && current_user.admin == 1
    @submission = Submission.new
  end

  def create_cui
    @cui = Cui.new
    @cui.user_id = current_user.id
    @cui.contest_id = params[:id] 
    @cui.point = nil
    @cui.save   
  end

  def compile(language, code)
    flash[:danger] = language
    if language.to_s == 'GNU G++ 14 6.4.0'
      @contest = Contest.find(@cui.contest_id)
      
      codes = File.open(current_user.id.to_s + ".cpp", "w")
      codes.write(code)
      codes.close()
      
      
      if !system("g++ -std=c++14 " + current_user.id.to_s + ".cpp -o " + current_user.id.to_s + ".exe")
        @submission.status ||= "Compile Error"  
      else
        @submission.status ||= "Runned Code"

        @io_contest_datas = Io.where(contest_id: @contest.id)
        @io_contest_datas.each do |io|
          ins = File.open(current_user.id.to_s + ".in", "w")
          ins.write(io.input)
          ins.close()
          outs = File.open(current_user.id.to_s + ".out", "w")
          outs.write(io.output)
          outs.close()
          def run
            @cur_status = system(current_user.id.to_s + ".exe < " + current_user.id.to_s + ".in > _" + current_user.id.to_s + ".out")
            if @cur_status == false
              @submission.status ||= "Run Time Error"
            end

            if FileUtils.compare_file(current_user.id.to_s + ".out", "_" + current_user.id.to_s + ".out")
              @submission.status ||= "Accept"
              @submission.point = @submission.point + @contest.point
            else
              @submission.status ||= "Wrong Answer"
            end
          end

          def count
             limit = @contest.time.to_i
             sleep(limit)
             @submission.status ||= "Time Limit"
             system("Taskkill /IM " + current_user.id.to_s + ".exe /F")
             Thread.kill(@run_thread)
          end 
          @run_thread = Thread.new{run()}
          @count_thread = Thread.new{count()}
          @run_thread.join
          @count_thread.join
        end
      end
      flash[:danger] = @submission.status
      system("rm -r " + current_user.id.to_s + ".cpp")
      system("rm -r " + current_user.id.to_s + ".in")
      system("rm -r " + current_user.id.to_s + ".out")
      system("rm -r " + "_" + current_user.id.to_s + ".out")
      system("rm -r " + current_user.id.to_s + ".exe")
    else 
      #ruby compiler

    end

  end

  def create
    @cui = Cui.where(user_id: current_user.id).where(contest_id: params[:id]).first
    create_cui if @cui.nil?
    @submission = Submission.new(submission_params)
    @submission.cui_id = @cui.id
    @submission.status = nil
    @submission.point = 0
    compile(@submission.language, @submission.code)
    @cui.update(point: @submission.point)
    @submission.save
    redirect_to submissions_path
  end

  private
    def set_submission
      @submission = Submission.find(params[:id])
    end

    def submission_params
      params.require(:submission).permit(:code, :language, :point, :cui_id)
    end
end
