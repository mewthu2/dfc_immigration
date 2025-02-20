class CreateParents < ActiveRecord::Migration[7.2]
  def change
    create_table :parents do |t|
      t.references :customer, null: false, foreign_key: true
      t.string  :first_name, null: false
      t.string  :middle_name
      t.string  :current_last_name, null: false
      t.string  :maiden_name
      t.date    :date_of_birth, null: false
      t.string  :birth_city, null: false
      t.string  :birth_state
      t.string  :birth_country, null: false
      t.string  :current_city, null: false
      t.string  :current_country, null: false
      t.integer :parent_type, default: 0

      t.timestamps
    end
  end
end
