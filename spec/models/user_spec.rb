require 'rails_helper'

RSpec.describe User, type: :model do
  it {should validate_presence_of :name}
  it {should validate_presence_of :email}
  it {should have_one :company}
  it {should allow_value('jason.m.falk@gmail.com').for(:email)}
  it {should_not allow_value('abc').for(:email)}
end
