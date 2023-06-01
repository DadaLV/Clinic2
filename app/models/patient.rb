class Patient < User
  has_many :appointments, dependent: :destroy, foreign_key: 'patient_id'
  has_many :doctors, through: :appointments
end
