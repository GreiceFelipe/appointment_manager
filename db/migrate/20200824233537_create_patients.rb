class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :name, null: false, default: ""
      t.date :birth_date, null: false, default: ""
      t.string :cpf, null: false, default: ""

      t.timestamps
    end

    add_index :patients, :cpf, unique: true
  end
end
