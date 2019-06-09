class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_to user_show_path
    else
      flash.now.alert = "Incorrect email/password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sessions_new_path
  end
end
