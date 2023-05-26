class Doctor < User
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  belongs_to :category, optional: false
end
