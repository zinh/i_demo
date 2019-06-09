class UserMailer < ApplicationMailer
  default from: 'notification@incubit.co.jp'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to your personal profile")
  end

  def reset_password_email
    @token = params[:reset_code]
    @user = params[:user]
    mail(to: @user.email, subject: "Your password reset link")
  end
end
