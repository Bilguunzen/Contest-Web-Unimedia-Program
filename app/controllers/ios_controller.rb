class IosController < ApplicationController
  before_action :set_io, only: [:show, :edit, :update, :destroy]

  def index
    @ios = Io.all
  end

  def show
  end

  def new
    @io = Io.new
  end

  def edit
  end

  def create
    @io = Io.new(io_params)
    @io.contest_id = Contest.last.id + 1
    @io.save
    respond_to do |format|
      if @io.save
        format.html { redirect_to @io, notice: 'Io was successfully created.' }
        format.json { render :show, status: :created, location: @io }
      else
        format.html { render :new }
        format.json { render json: @io.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @io.update(io_params)
        format.html { redirect_to @io, notice: 'Io was successfully updated.' }
        format.json { render :show, status: :ok, location: @io }
      else
        format.html { render :edit }
        format.json { render json: @io.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @io.destroy
    respond_to do |format|
      format.html { redirect_to ios_url, notice: 'Io was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_io
      @io = Io.find(params[:id])
    end

    def io_params
      params.require(:io).permit(:input, :output, :contest_id)
    end
end
