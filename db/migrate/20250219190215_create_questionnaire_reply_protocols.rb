class CreateQuestionnaireReplyProtocols < ActiveRecord::Migration[7.0]
  def change
    create_table :questionnaire_reply_protocols do |t|
      t.references :questionnaire_reply, null: false, foreign_key: true
      t.string :protocol

      t.timestamps
    end
  end
end
