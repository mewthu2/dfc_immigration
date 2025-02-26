class CreateQuestionnaireReplyQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questionnaire_reply_questions do |t|
      t.references :questionnaire, null: false, foreign_key: true, index: true
      t.references :question, null: false, foreign_key: true, index: true
      t.string :answer

      t.timestamps
    end
  end
end
