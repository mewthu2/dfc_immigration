class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.bigint :kind
      t.string :enounce

      t.timestamps
    end
  end
end
