class SearchsController < ApplicationController
  def new
    flash[:notice] = params[:search][:value]
    @contests = Contest.all.order('start DESC')
    @upcoming_contests = Array.new
    @running_contests = Array.new
    @past_contests = Array.new
    @contests.each do |contest|
      if contest.title.downcase.to_s.include? params[:search][:value].to_s
        if get_time(contest.deadline).to_s == "past"
          @past_contests.push(contest)
        elsif get_time(contest.start).to_s == "past"
          @running_contests.push(contest)
        else
          @upcoming_contests.push(contest)
        end
      end
    end
  end
end
