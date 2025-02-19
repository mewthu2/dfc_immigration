class QuestionnaireReplyQuestion < ApplicationRecord
  # Callbacks
  # Associacoes
  belongs_to :questionnaire_reply
  belongs_to :question
  has_many :questionnaire_reply_question_alternatives, dependent: :destroy

  accepts_nested_attributes_for :questionnaire_reply_question_alternatives, allow_destroy: false

  # Validacoes
  validates :answer, length: { maximum: 1000 }

  # Escopos
  default_scope { select('questionnaire_reply_questions.*, questions.enounce, questions.kind as kind_question').joins(:question).order(:order) }

  # Metodos estaticos
  # Metodos publicos
  # Metodos GET
  # Metodos SET

  # Nota: os metodos somente utilizados em callbacks ou utilizados somente por essa
  #       propria classe deverao ser privados (remover essa anotacao)
end
