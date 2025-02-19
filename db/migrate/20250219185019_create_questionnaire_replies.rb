class CreateQuestionnaireReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :questionnaire_replies do |t|
      t.references :questionnaire, null: false, foreign_key: true, index: true
      t.references :user_id, null: false, foreign_key: true, index: true
      t.string :slug
      t.string :token
      t.boolean :replied, default: false
      t.bigint :notify_count
      t.datetime :notify_after

      t.timestamps
    end
  end
end
