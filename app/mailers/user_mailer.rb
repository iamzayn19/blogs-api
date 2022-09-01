class UserMailer < ApplicationMailer
  default from: "blogs@api.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user,token)
    @token = token
    @user = user
    mail to: user.email, subject: "Sign up confirmation"
  end

  def resend_confirmation(user,token)
    @token = token
    @user = user
    mail to: user.email, subject: "Account confirmation"
  end 
end
