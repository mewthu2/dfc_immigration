class CreateQuestionnaireQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questionnaire_questions do |t|
      t.references :questionnaire, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.boolean :mandatory
      t.bigint :order

      t.timestamps
    end
  end
end