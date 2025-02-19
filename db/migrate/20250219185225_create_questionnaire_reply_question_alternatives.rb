class CreateQuestionnaireReplyQuestionAlternatives < ActiveRecord::Migration[7.0]
  def change
    create_table :questionnaire_reply_question_alternatives do |t|
      t.references :questionnaire_reply_question, null: false, foreign_key: true, index: { name: :index_reply_question_alternatives }
      t.references :question_alternative, null: false, foreign_key: true, index: { name: :index_question_alternatives }
      t.string :answer

      t.timestamps
    end
  end
end
