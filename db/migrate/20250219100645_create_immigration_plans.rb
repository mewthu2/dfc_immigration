class CreateImmigrationPlans < ActiveRecord::Migration[7.2]
  def change
    create_table :immigration_plans do |t|
      t.string :name, null: false, index: { unique: true }
      t.integer :type, null: false, default: 0
      t.decimal :price, null: false, precision: 10, scale: 2
      t.text :description

      t.timestamps
    end
  end
end
