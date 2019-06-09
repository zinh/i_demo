class UserController < ApplicationController
  def register
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_show_path
    else
      render :register
    end
  end

  def update
  end

  def show
    user_id = session[:user_id]
    @user = User.find_by(id: user_id)
    if @user.blank?
      redirect_to user_register_path 
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
