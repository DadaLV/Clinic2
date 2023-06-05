class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :category, optional: true
  has_many :appointments_as_doctor, class_name: 'Appointment', foreign_key: 'doctor_id'
  has_many :appointments_as_patient, class_name: 'Appointment', foreign_key: 'patient_id'

  validates :phone, uniqueness: true
  validates :full_name, presence: true
  
  enum role: { admin: "admin", doctor: "doctor", patient: "patient" }

  def has_role?(role)
    self.role == role.to_s
  end

  def email_required?
    false
  end
  
  def email_changed?
    false
  end

  def password_required?
    new_record? || password.present?
  end

  def password_match?
    password.blank? || password_confirmation.present?
  end
  
end
