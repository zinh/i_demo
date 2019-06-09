class ApplicationController < ActionController::Base
  def authenticate
    user_id = session[:user_id]
    @user = User.find_by(id: user_id)
    if @user.blank?
      redirect_to sessions_new_path
    end
  end
end
