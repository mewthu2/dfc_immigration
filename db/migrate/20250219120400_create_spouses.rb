class CreateSpouses < ActiveRecord::Migration[7.2]
  def change
    create_table :spouses do |t|
      t.references :customer, null: false, foreign_key: true
      t.string  :first_name, null: false
      t.string  :middle_name
      t.string  :last_name, null: false
      t.date    :date_of_birth, null: false
      t.string  :birth_city, null: false
      t.string  :birth_state
      t.string  :birth_country, null: false
      t.date    :date_of_marriage, null: false
      t.string  :place_of_marriage, null: false
      t.date    :marriage_end_date
      t.string  :place_of_marriage_end
      t.boolean :is_active, default: true, null: false
      t.boolean :is_spouse_in_military, default: false

      t.timestamps
    end
  end
end
