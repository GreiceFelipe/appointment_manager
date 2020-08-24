class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name, null: false, default: ""
      t.string :crm, null: false, default: ""
      t.string :crm_uf, null: false, default: ""

      t.timestamps
    end

    add_index :doctors, [:crm, :crm_uf], unique: true
  end
end
