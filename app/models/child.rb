# frozen_string_literal: true

class Child < ApplicationRecord
  belongs_to :customer

  validates :full_legal_name, :date_of_birth, :country_of_birth, presence: true
  validates :applying_with_customer, inclusion: { in: [ true, false ] }
end
