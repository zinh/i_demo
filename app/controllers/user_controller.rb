class UserController < ApplicationController
  before_action :authenticate, only: [:update, :show]
  def register
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      UserMailer.with(user: @user).welcome_email.deliver
      redirect_to user_show_path
    else
      render :register
    end
  end

  def update
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
