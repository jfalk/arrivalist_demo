class UserMailer < ApplicationMailer
  def confirm_email(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => 'Welcome to Arrivalist')
  end

  def approved_email(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => 'Your portal access has been approved.')
  end
end
