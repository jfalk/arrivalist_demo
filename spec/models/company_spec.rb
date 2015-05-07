require 'rails_helper'

RSpec.describe Company, type: :model do
  it {should validate_presence_of :name}
  it {should validate_presence_of :street}
  it {should validate_presence_of :city}
  it {should validate_presence_of :state}
  it {should validate_presence_of :zip_code}
  it {belong_to :contact_user}
end
