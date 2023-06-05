require 'rails_helper'
require 'capybara/rails'

RSpec.describe "Recommendation Feature", type: :feature do
  before do
    doctor = Doctor.create(full_name: "John Doe", phone: "1234567890", password: "password")
    patient = Patient.create(full_name: "Jane Smith", phone: "9876543210", password: "password")
    login_as(doctor, scope: :user)
  end

  it "leaves a recommendation for a patient" do
    visit "/index"
    click_link "View Appointments"
    click_link "Leave Recommendation"
    fill_in "recommendation_content", with: "Take pills!"
    click_button "Submit"
    expect(page).to have_content("Appointment closed.")
  end
end