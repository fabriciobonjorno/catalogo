# frozen_string_literal: true

class Family < ApplicationRecord
  validates :family_code, :family_description, presence: true
  validates :family_code, :family_description, uniqueness: true

  belongs_to :group
  has_many :products, dependent: :destroy
end
