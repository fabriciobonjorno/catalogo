# frozen_string_literal: true

class Family < ApplicationRecord
  validates :family_code, :family_description, presence: true
  validates :family_description, uniqueness: true

  belongs_to :group
  has_many :products, dependent: :destroy

  scope :order_family, -> {order(:family_description, :desc)}
end
