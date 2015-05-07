class CompaniesController < ApplicationController
  def new
    @company = Company.new
    @company.build_contact_user
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      flash.notice = 'Thank you for your interest in Arrivalist! An email to confirm your email address should arrive in your inbox shortly.'
      sign_in(@company.contact_user)
      redirect_to root_url
    else
      render :new
    end
  end

  private
    def company_params
      params.require(:company).permit(:name, :street, :city, :state, :zip_code, contact_user_attributes: [:name, :email, :password])
    end
end
