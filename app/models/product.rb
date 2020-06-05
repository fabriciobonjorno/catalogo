# frozen_string_literal: true

class Product < ApplicationRecord
  include PgSearch::Model
  extend FriendlyId
  validates :product_code, :product_description, :product_ean, :product_dun, :image, presence: true
  validates :product_code, :product_description, uniqueness: true

  belongs_to :family, inverse_of: :products
  belongs_to :group
  belongs_to :tax_classification
  has_many :similar_products, dependent: :destroy
  accepts_nested_attributes_for :similar_products, reject_if: :all_blank, allow_destroy: true

  # belongs_to :parent, class_name: 'Product', optional: true
  # has_many :sub_products, class_name: 'Product', foreign_key: :parent_id, dependent: :destroy

  has_one_attached :image

  friendly_id :product_description, use: :slugged

  pg_search_scope :search,
                  against: %i[product_description product_ean product_code product_dun],
                  using: { tsearch: { prefix: true } }

  validate :image_validation

  def image_validation
    if respond_to?(:image) && image.attached?
      if image.blob.byte_size > 2_000_000
        image.purge
        errors[:base] << 'Tamanho maximo 2MB'
      elsif !image.blob.content_type.starts_with?('image/png', 'image/jpeg', 'image/jpg')
        image.purge
        errors[:base] << 'Formato invalido use PNG, JPEG, JPG'
      end
    end
  end

  #scope :only_parents, -> { where(parent_id: nil) }
  scope :releases_home, -> { where(releases: true) }
  scope :status_product, -> { where(status: true) }
  scope :status_dimension, -> { where(status_dimension: true) }
  scope :releases_true, -> { where(releases: true).count }
  scope :status_true, -> { where(status: true).count }
end
