# frozen_string_literal: true

class Questionnaire < ApplicationRecord
  belongs_to :immigration_plan
  has_many :questions, dependent: :destroy

  validates :name, presence: true

  # Os nomes serão Petitioner ou Beneficiary
end
