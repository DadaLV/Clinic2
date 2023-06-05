class AppointmentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!

  def index
    if current_user.patient?
      @appointments = current_user.appointments_as_patient
    elsif current_user.doctor?
      @appointments = current_user.appointments_as_doctor
    else
      @appointments = Appointment.all
    end
  end

  def new
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

  def destroy
    @appointment = Appointment.find(params[:id])
    if @appointment.open?
      @appointment.destroy
      redirect_to appointments_path, notice: 'Appointment deleted successfully.'
    else
      redirect_to appointment_path(@appointment), alert: 'Closed appointments cannot be deleted.'
    end
  end
  
  def close
    @appointment = Appointment.find(params[:id])
    @appointment.close(params[:appointment][:recommendations])

    redirect_to appointments_path, notice: 'Appointment closed.'
  end
  private

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :recommendations, :status)
  end

end