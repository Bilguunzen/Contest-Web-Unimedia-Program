class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to current_user
    end
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.password?(params[:session][:password])
      #user.update(updated_at: Time.now)
      log_in user
      redirect_to user
    else
      flash[:danger] ||= 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  def destroy
    log_out
    render 'new'
  end
end
