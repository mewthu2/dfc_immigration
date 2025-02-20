class CreateCustomers < ActiveRecord::Migration[7.2]
  def change
    create_table :customers do |t|
      t.references :immigration_plan, null: false, foreign_key: true
      t.string  :first_name, null: false
      t.string  :last_name, null: false
      t.boolean :status, default: false
      t.string  :document, null: false
      t.string  :gender
      t.string  :ethnicity
      t.string  :race
      t.date    :date_of_birth, null: false
      t.string  :birth_city
      t.string  :birth_state
      t.string  :birth_country
      t.string  :phone_number, null: false
      t.string  :alien_registration_number
      t.string  :social_security_number
      t.float   :height
      t.float   :weight
      t.string  :eye_color
      t.string  :hair_color
      t.string  :marital_status
      t.integer :marriage_count

      t.timestamps
    end
  end
end
