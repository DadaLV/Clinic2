class PatientsController < ApplicationController
  # load_and_authorize_resource
  before_action :authenticate_user!
  def index
    @doctors = Doctor.all
  end
end
