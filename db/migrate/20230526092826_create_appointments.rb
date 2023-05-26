class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.text :recommendations, default: ""
      t.string :status, default: "open"

      t.timestamps
    end
  end
end
