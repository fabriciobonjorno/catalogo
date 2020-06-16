# frozen_string_literal: true

class Group < ApplicationRecord
  validates :group_code, :group_description, presence: true
  validates :group_description, uniqueness: true

  has_many :families, dependent: :destroy
  belongs_to :line
  
  default_scope { order(group_description: :asc)}
end
