class CreateResidences < ActiveRecord::Migration[7.2]
  def change
    create_table :residences do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :street_address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :apt_number
      t.string :zip_code
      t.string :country, null: false
      t.date   :from_date, null: false
      t.date   :to_date, null: false

      t.timestamps
    end
  end
end
