class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.references :user, null: true, foreign_key: true, foreign_key: { to_table: :users, where: "role = 'doctor'" }

      t.timestamps
    end
  end
end
