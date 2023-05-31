class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
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
end
