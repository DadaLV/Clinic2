class PatientsController < ApplicationController
  def index
    @doctors = Doctor.includes(:category).where.not(category_id: nil)
  end
end
