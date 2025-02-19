class QuestionnaireReplyQuestionAlternative < ApplicationRecord
  # Callbacks
  # Associacoes
  belongs_to :questionnaire_reply_question
  belongs_to :question_alternative

  # Validacoes
  validates :answer, length: { maximum: 1000 }
  # validates :descricao, presence: true, uniqueness: true, length: { maximum: 255 }

  default_scope { select('questionnaire_reply_question_alternatives.*, question_alternatives.description as alternative').joins(:question_alternative) }
  # Escopos

  add_scope :select_list do
    select(%(
      questionnaire_reply_question_alternatives.*,
      questionnaire_reply_questions.answer AS questionnaire_reply_question_answer
    )).joins(:questionnaire_reply_question)
  end

  add_scope :search do |valor|
    where('questionnaire_reply_question_alternatives.id = :id OR 1 LIKE :valor', id: valor, valor: "#{valor}%")
  end

  # Metodos estaticos
  # Metodos publicos
  # Metodos GET
  # Metodos SET

  # Nota: os metodos somente utilizados em callbacks ou utilizados somente por essa
  #       propria classe deverao ser privados (remover essa anotacao)
end
