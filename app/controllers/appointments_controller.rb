class AppointmentsController < ApplicationController

  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.patient?
      @appointments = current_user.appointments_as_patient
    elsif current_user.doctor?
      @appointments = current_user.appointments_as_doctor
    else
      @appointments = Appointment.all
    end
  end

  def show
  end

  def new
    authorize! :new, @appointment
    @appointment = Appointment.new
    @doctors = User.where(role: 'doctor')
    @patients = User.where(role: 'patient')
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.status = :open

    if @appointment.save
      redirect_to appointments_path, notice: 'Appointment was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize! :edit, @appointment
  end

  def update
    authorize! :update, @appointment
    if @appointment.update(appointment_params.merge(status: "closed"))
      redirect_to appointments_path, notice: 'Appointment closed.'
    else
      render :edit
    end
  end

  def destroy
    if @appointment.open?
      @appointment.destroy
      redirect_to appointments_path, notice: 'Appointment deleted successfully.'
    else
      redirect_to appointment_path(@appointment), alert: 'Closed appointments cannot be deleted.'
    end
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :recommendations, :status)
  end

end