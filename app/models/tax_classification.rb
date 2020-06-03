# frozen_string_literal: true

class TaxClassification < ApplicationRecord
  validates :tax_code, presence: true
  validates :tax_code, uniqueness: true

  has_many :products, dependent: :destroy
end
