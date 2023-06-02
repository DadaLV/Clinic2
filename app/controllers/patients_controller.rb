class PatientsController < ApplicationController
  # load_and_authorize_resource
  before_action :authenticate_user!
  def index
    @doctors = Doctor.includes(:category).where.not(category_id: nil)
  end
end
