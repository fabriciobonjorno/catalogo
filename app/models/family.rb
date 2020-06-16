class Family < ApplicationRecord
  validates :family_code, :family_description, presence: true
  validates :family_description, uniqueness: true

  belongs_to :group
  has_many :products, dependent: :destroy

  default_scope -> { order(family_description: :asc)}
end
