class QuestionnaireQuestion < ApplicationRecord
  audited associated_with: :questionnaire
  # Callbacks
  # Associacoes
  belongs_to :questionnaire
  belongs_to :question

  # Validacoes
  validates :question_id, uniqueness: { scope: :questionnaire_id }

  # Escopos

  default_scope { order(:order) }

  add_scope :by_question do |question_id|
    joins(:question).where(questions: { id: question_id }) if question_id.present?
  end
end
