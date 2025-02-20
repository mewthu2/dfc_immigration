# frozen_string_literal: true

class ImmigrationPlan < ApplicationRecord
  has_many :customers
  has_many :questionnaires

  validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than: 0 }, presence: true
  validates :type, presence: true

  enum name: { economic: 0, executive: 1, firstclass: 2 }
end
