class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.references :questionnaire, null: false, foreign_key: true
      t.text :text, null: false
      t.string :question_type, null: false # text, boolean, multiple_choice, etc.

      t.timestamps
    end
  end
end
