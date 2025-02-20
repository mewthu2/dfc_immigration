class Residence < ApplicationRecord
  belongs_to :customer

  validates :street_address, :city, :state, :country, :from_date, :to_date, presence: true
end
