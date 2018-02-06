class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all.order('raiting DESC')
  end

  def show
    @cuis = Cui.where(user_id: @user.id).order('created_at DESC')
  end

  def new
    if logged_in?
      redirect_to current_user
    end
    @user = User.new
  end

  def edit
    if current_user != @user
      redirect_to '/error'
    end
  end

  def create
    @user = User.new(user_params)
    @user.raiting = 1500
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_user
      begin
        @user = User.find(params[:id])
      rescue
        redirect_to '/error'
      end
    end

    def user_params
      params.require(:user).permit(:handle, :email, :password)
    end
end
