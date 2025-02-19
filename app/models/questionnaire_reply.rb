class QuestionnaireReply < ApplicationRecord
  has_shortened_urls
  # Callbacks
  before_create :generate_slug
  after_update :generate_protocol, if: ->(qr) { qr.replied? }
  after_update :generate_replied, if: ->(qr) { qr.replied? }

  # Associacoes
  has_secure_token :token
  belongs_to :questionnaire
  belongs_to :user

  has_many   :questionnaire_reply_questions, dependent: :destroy

  # Validacoes
  validates :questionnaire_id, presence: true
  validates :user_id, presence: true

  # Nested Forms
  accepts_nested_attributes_for :questionnaire_reply_questions, allow_destroy: true

  # Escopos

  add_scope :select_list do
    select(%(
      questionnaire_replies.*
    ))
  end

  add_scope :search_replies do
    select(%(questionnaires.title,
      questionnaire_replies.*
      ))
      .joins(:questionnaire)
      .order(%(questionnaire_replies.replied, questionnaires.title DESC))
  end

  add_scope :search do |valor|
    where('questionnaire_replies.id = :id OR 1 LIKE :valor', id: valor, valor: "#{valor}%") if valor.present?
  end

  add_scope :by_user do |user|
    joins(:user).where(user: user)
  end

  add_scope :by_replied do |replied|
    where(replied: replied) if replied.present?
  end


  add_scope :replieds do
    where(replied: true, reason: nil)
  end

  add_scope :not_replieds do
    where(replied: true).where.not(reason: nil)
  end

  add_scope :to_be_answered do
    where(replied: false)
  end

  add_scope :not_mandatory do
    where(questionnaires: { mandatory: false })
  end

  add_scope :actives do
    where(questionnaire: { active: true })
  end

  add_scope :notificable do |symbol|
    where('now() > notify_after') if symbol == '0'
  end

  def generate_slug
    url = "#{questionnaire.title} #{questionaire.id}"
    self.slug = url.parameterize
  end

  def update_notify_after
    update(notify_after: Time.now + 4.hours, notify_count: self.notify_count += 1)
  end

  def clean_reply
    update(replied: false)
    update(reason: nil)
    questionnaire_reply_questions.each do |qrq|
      qrq.update(answer: nil)
      next if qrq.questionnaire_reply_question_alternatives.present?
      qrq.questionnaire_reply_question_alternatives.update(answer: nil)
    end
    update(notify_after: created_at, notify_count: self.notify_count = 0)
  end

  private

  def generate_protocol
    return if questionnaire_reply_protocol.present?
    create_questionnaire_reply_protocol!(protocol: ('A'..'Z').to_a.sample(6).join)
  end
end
