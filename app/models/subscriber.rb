class Subscriber < ApplicationRecord
  validates :email, presence: true, format: { with: /((\w+\s?-?\w+)(,|\z))/i}
  validates :email, uniqueness: true
end
