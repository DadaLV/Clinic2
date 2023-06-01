class Doctor < User
  has_many :appointments, dependent: :destroy, foreign_key: 'doctor_id'
  has_many :patients, through: :appointments
  belongs_to :category, optional: true
end
