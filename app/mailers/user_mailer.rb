class UserMailer < ApplicationMailer
  default from: 'notification@incubit.co.jp'

  def welcome_email
    @user = params[:user]
    mail(to: @user.email, subject: "Welcome to your personal profile")
  end
end
