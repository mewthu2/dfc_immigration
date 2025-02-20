# frozen_string_literal: true

class Spouse < ApplicationRecord
  belongs_to :customer

  validates :first_name, :last_name, :date_of_birth, :birth_city, :birth_state, :birth_country,
            :date_of_marriage, :place_of_marriage, presence: true

  validates :is_active, inclusion: { in: [ true, false ] }
  validates :is_spouse_in_military, inclusion: { in: [ true, false ] }
  validates :is_spouse_in_military, presence: true, if: :current_spouse?

  validates :marriage_end_date, presence: true, if: :is_ex_spouse?

  scope :current_spouse, -> { where(is_active: true) }
  scope :former_spouses, -> { where(is_active: false) }

  def is_ex_spouse?
    !is_active
  end

  def current_spouse?
    is_active
  end
end
