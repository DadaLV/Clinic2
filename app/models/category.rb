class Category < ApplicationRecord
  has_many :doctors, class_name: 'User', foreign_key: 'category_id'
  validates :name, presence: true, length: { maximum: 30 }
end
