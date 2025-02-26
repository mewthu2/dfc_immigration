class QuestionnaireReplyProtocol < ApplicationRecord
  # Callbacks
  # Associacoes
  belongs_to :questionnaire_reply

  # Validacoes
  validates :protocol, length: { maximum: 255 }
  # validates :descricao, presence: true, uniqueness: true, length: { maximum: 255 }

  # Escopos

  # Metodos estaticos
  # Metodos publicos
  # Metodos GET
  # Metodos SET

  # Nota: os metodos somente utilizados em callbacks ou utilizados somente por essa
  #       propria classe adeverao ser privados (remover essa anotacao)
end
