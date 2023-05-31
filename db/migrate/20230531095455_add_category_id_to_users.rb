class AddCategoryIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :category, null: true, foreign_key: true
  end
end
