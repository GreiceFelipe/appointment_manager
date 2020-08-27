class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.datetime :starts_at, null: false
      t.datetime :ends_at, null: false
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end

    add_index :appointments, :starts_at, unique: true
  end
end
