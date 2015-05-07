class AdminController < ApplicationController
  before_filter :current_user_signed_in

  def unapproved_users
    @users = User.where(approved: false, email_confirmed: true)
  end

  def approve
    user = User.find(params[:id])
    user.approve
    redirect_to admin_unapproved_url
  end

  private

    def current_user_signed_in
      return redirect_to signin_url unless current_user
    end
end
