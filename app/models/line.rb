# frozen_string_literal: true

class Line < ApplicationRecord
  has_many :groups, dependent: :destroy
  has_many :families, through: :groups
  has_many :products, through: :families
end
