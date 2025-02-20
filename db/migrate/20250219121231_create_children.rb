class CreateChildren < ActiveRecord::Migration[7.2]
  def change
    create_table :children do |t|
      t.references :customer, null: false, foreign_key: true
      t.string  :full_legal_name, null: false
      t.date    :date_of_birth, null: false
      t.string  :country_of_birth, null: false
      t.string  :alien_registration_number
      t.boolean :applying_with_customer, default: false

      t.timestamps
    end
  end
end
