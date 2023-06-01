class Appointment < ApplicationRecord
  belongs_to :doctor, class_name: 'User', foreign_key: 'doctor_id'
  belongs_to :patient, class_name: 'User', foreign_key: 'patient_id'

  enum status: { open: 'open', closed: 'closed' }
  validates :status, presence: true, inclusion: { in: Appointment.statuses.keys }
  validate :validate_max_open_appointments, on: :create

  def close(recommendations)
    self.status = :closed
    self.recommendations = recommendations
    save
  end

  MAX_OPEN_APPOINTMENTS = 10

  private

  def validate_max_open_appointments
    return unless doctor && doctor.appointments_as_doctor.open.count >= MAX_OPEN_APPOINTMENTS

    errors.add(:doctor_id, "has reached the maximum number of open appointments.")
  end
end
