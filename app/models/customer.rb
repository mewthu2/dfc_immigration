# frozen_string_literal: true

class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :immigration_plan

  has_many :answers, dependent: :destroy
  has_many :residences, dependent: :destroy
  has_many :children, dependent: :destroy
  has_many :spouses, dependent: :destroy
  has_many :former_spouses, -> { former_spouses }, class_name: 'Spouse'

  has_one  :current_spouse, -> { current_spouse }, class_name: 'Spouse'
  has_one  :mother, class_name: 'Parent', foreign_key: :customer_id, dependent: :destroy
  has_one  :father, class_name: 'Parent', foreign_key: :customer_id, dependent: :destroy

  validates :name, :email, presence: true
  # TODO: regex para validação de email
  validates :email, uniqueness: true

  enum status: { pending: 0, approved: 1, reproved: 2 }
  enum gender: { male: 'Male', female: 'Female', other: 'Other' }
  enum ethnicity: { hispanic_or_latino: 'Hispanic or Latino', not_hispanic_or_latino: 'Not Hispanic or Latino' }
  enum race: {
    white: 'White',
    asian: 'Asian',
    black_or_african_american: 'Black or African American',
    american_indian_or_alaska_native: 'American Indian or Alaska Native',
    native_hawaiian_or_other_pacific_islander: 'Native Hawaiian or Other Pacific Islander'
  }
  enum marital_status: { single: 'Single', married: 'Married', divorced: 'Divorced',
                         separated: 'Separated', widowed: 'Widowed' }
end
