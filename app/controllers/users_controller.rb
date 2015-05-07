class UsersController < ApplicationController

  def confirm_email
    if (User.confirm_email(params[:email], params[:hash]))
      flash.notice = 'Your email has been confirmed! We will review your application and get back to you shortly.'
    else
      flash.error = 'There was an error confirming your email address.'
    end
    redirect_to root_url
  end
end
