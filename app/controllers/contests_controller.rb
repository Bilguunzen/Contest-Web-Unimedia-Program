class ContestsController < ApplicationController
  before_action :admin?, only: [:new, :edit, :update, :destroy]
  before_action :set_contest, only: [:show, :edit, :update, :destroy]
  

  def index
    @contests = Contest.all.order('start DESC')
    @upcoming_contests = Contest.where(["start > ?", Time.now]).order('start DESC')
    @running_contests = Contest.where(["deadline > ? AND start < ?", Time.now, Time.now]).order('start DESC')
    @past_contests = Contest.where(["deadline < ?", Time.now]).order('start DESC')
    
  end

  def index1
    @contests = Contest.all.order('start')
    @upcoming_contests = Contest.where(["start > ?", Time.now]).order('start')
    @running_contests = Contest.where(["deadline > ? AND start < ?", Time.now, Time.now]).order('start')
    @past_contests = Contest.where(["deadline < ?", Time.now]).order('start')
  end

  def show
  end

  def new
    @contest = Contest.new
  end

  def edit
  end

  def create
    @contest = Contest.new(contest_params)
    @contest.admin = current_user.id
    respond_to do |format|
      if @contest.save
        format.html { redirect_to @contest, notice: 'Contest was successfully created.' }
        format.json { render :show, status: :created, location: @contest }
      else
        format.html { render :new }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contest.update(contest_params)
        format.html { redirect_to @contest, notice: 'Contest was successfully updated.' }
        format.json { render :show, status: :ok, location: @contest }
      else
        format.html { render :edit }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    @contest.destroy
    respond_to do |format|
      format.html { redirect_to contests_url, notice: 'Contest was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def admin?
      if logged_in? == false || current_user.admin != 1
        redirect_to '/error'
      end
    end

    def set_contest
      begin
        @contest = Contest.find(params[:id])  
      rescue
        redirect_to '/error'
      end
    end

    def contest_params
      params.require(:contest).permit(:title, :detail, :deadline, :start, :time, :point, :code, :prize, :image)
    end
end
