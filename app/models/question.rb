# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :questionnaire

  validates :text, :question_type, presence: true

  # enum question_type: { text: 0, boolean: 1, multiple_choice: 2 }
end
