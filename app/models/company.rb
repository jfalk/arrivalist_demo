class Company < ActiveRecord::Base
  belongs_to :contact_user, class_name: 'User', inverse_of: :company

  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true

  accepts_nested_attributes_for :contact_user

end
