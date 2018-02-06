class CuisController < ApplicationController
  before_action :set_cui, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to '/error' if Contest.find_by(id: params[:id]) == nil
    @cuis = Cui.where(contest_id: params[:id]).order('point DESC')
  end

  def show
  end

  def new
    @cui = Cui.new
  end

  def create
    @cui = Cui.new(cui_params)

    respond_to do |format|
      if @cui.save
        format.html { redirect_to @cui, notice: 'Cui was successfully created.' }
        format.json { render :show, status: :created, location: @cui }
      else
        format.html { render :new }
        format.json { render json: @cui.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_cui
      @cui = Cui.find(params[:id])
    end

    def cui_params
      params.require(:cui).permit(:contest_id, :user_id, :point)
    end
end