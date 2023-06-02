require 'rails_helper'
require 'capybara/rails'
include Devise::Test::IntegrationHelpers

RSpec.describe "Create Appointment", type: :request do
  let(:patient) { User.create(phone: "1234567890", password: "password", role: "patient") }
  let!(:doctor) { User.create(phone: "9876543210", password: "password", role: "doctor") }

  before do
    sign_in patient
  end

  it "creates a new appointment" do
    visit root_path
    click_link "Create Appointment"
    select doctor.full_name, from: "Doctor"
    click_button "Create Appointment"
    expect(page).to have_current_path(appointments_path)
    expect(page).to have_content("Appointment was successfully created.")
    expect(page).to have_content(doctor.full_name)
  end
end