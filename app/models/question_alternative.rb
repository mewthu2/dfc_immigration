class QuestionAlternative < ApplicationRecord
  # Callbacks
  # Associacoes
  belongs_to :question
  has_many :questionnaire_reply_question_alternatives
  has_one_attached :photo, dependent: :destroy

  # Validacoes
  validates :photo, size: { less_than: 10.megabytes, message: 'is too large' }
  validates :photo, content_type: { in: ['image/png', 'image/jpg', 'image/jpeg'] }
  validates :description, presence: true, length: { maximum: 255 }
end
