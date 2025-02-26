class Question < ApplicationRecord
  # Enum
  enum kind: [
    :only_one,
    :multiple,
    :multiple_yes_or_not,
    :multiple_tree,
    :note_five,
    :note_ten,
    :text,
    :list
  ], _prefix: :kind

  # Associations
  has_many   :questionnaire_questions
  has_many   :question_alternatives, dependent: :destroy
  has_many   :questionnaire_reply_questions, dependent: :destroy

  # Validations
  validates :enounce, presence: true, length: { maximum: 500 }
  validates :kind, presence: true

  # Nested
  accepts_nested_attributes_for :question_alternatives, allow_destroy: true

  # Scope
  add_scope :select_list do
    select(%(
      questions.*,
      count(*) as alternatives_count
    )).left_joins(:question_alternatives)
      .group('questions.id')
  end

  add_scope :search do |s|
    where('questions.id LIKE :s', s: "#{s}%") if s.present?
  end

  add_scope :by_enounce do |enounce|
    where(enounce: [ enounce ]) if enounce.present?
  end

  add_scope :by_kind do |kind|
    where(kind: [ kind ]) if kind.present?
  end

  add_scope :by_created_at do |start_date, end_date|
    where(created_at: Time.parse(start_date).beginning_of_day..Time.parse(end_date).end_of_day) if start_date.present? && end_date.present?
  end

  def replied?
    questionnaire_reply_questions.joins(:questionnaire_reply).where(questionnaire_replies: { replied: true })&.first&.present?
  end
end
