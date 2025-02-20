# frozen_string_literal: true

class Parent < ApplicationRecord
  belongs_to :customer

  validates :first_name, :current_last_name, :date_of_birth, :birth_city, :birth_country,
            :current_city, :current_country, presence: true

  enum parent_type: { mother: 0, father: 1 }
end
