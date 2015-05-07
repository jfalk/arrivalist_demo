require 'digest'

class User < ActiveRecord::Base
  has_one :company, inverse_of: :contact_user, foreign_key: 'contact_user_id'

  validates :name, presence: true
  validates :email, presence: true, email: true

  has_secure_password

  before_save :downcase_email

  after_create :send_confirmation_email

  def email_hash
    Digest::SHA2.base64digest(email)
  end

  def approve
    self.approved = true
    save!
    UserMailer.approved_email(self).deliver
  end

  def self.confirm_email(email, hash)
    user = User.find_by_email(email)
    matches = user.email_hash == hash
    if(matches)
      user.update(email_confirmed: true)
    end
    matches
  end

  private
    def downcase_email
      self.email.downcase!
    end

    def send_confirmation_email
      UserMailer.confirm_email(self).deliver
    end
end
