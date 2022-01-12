class UserMailer < ApplicationMailer
  def send_email(id)
    @user = User.find(id)
    mail(to: "graham@striv3r.com", subject: 'Account deactivation')
  end
end