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

  def forgot_password
  end

  def forgot_password_check
    email = params[:email]
    user = User.find_by(email: email)
    if user
      reset_code = user.generate_reset_password_code
      UserMailer.with(reset_code: reset_code, user: user).reset_password_email.deliver
    end
    render :forgot_password_check
  end

  def reset_password
    if params[:token].blank?
      render plain: "Invalid url"
    else
      user = User.find_by(reset_password_code: params[:token])
      if user.present? && user.reset_sent_at + 6.hour > Time.current
        @token = params[:token]
        render :reset_password
      else
        render plain: "Invalid url"
      end
    end
  end

  def change_password
    user = User.find_by(reset_password_code: params[:token])
    if user.present?
      if user.update_password(password: params[:password], password_confirmation: params[:password_confirmation])
        flash.now.notice = "Password changed. Please login again"
        redirect_to sessions_new_path
      else
        @token = params[:token]
        @errors = user.errors
        flash.now.alert = "Invalid password"
        render :reset_password
      end
    else
      render status: :forbidden
    end
  end

end
