class RemoveDoctorIdFromCategories < ActiveRecord::Migration[7.0]
  def change
    remove_reference :categories, :doctor, foreign_key: true
  end
end
