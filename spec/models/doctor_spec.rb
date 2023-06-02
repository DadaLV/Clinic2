require 'rails_helper'
require 'capybara/rails'

RSpec.describe Doctor, type: :model do
  it "is valid with a valid phone number" do
    doctor = Doctor.new(phone: "1234567890", role: "doctor", full_name: "Eric k", password: "password")
    expect(doctor).to be_valid
  end

  it "is invalid with an invalid phone number" do
    doctor = Doctor.new(phone: "123")
    expect(doctor).to_not be_valid
  end
end