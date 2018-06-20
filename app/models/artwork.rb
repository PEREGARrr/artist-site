# frozen_string_literal: true

class Artwork < ApplicationRecord
  extend FriendlyId

  friendly_id :title, use: :slugged
  has_attached_file :image, styles: { large: '800x', medium: '400x' }

  validates :title, :slug, :media, :size, presence: true
  validates :price, presence: true, if: :for_sale?
  validates :artwork_type, inclusion: { in: %w(pastel painting sketch) }
  validates :featured, :for_sale, inclusion: { in: [true, false] }

  validate :slug_is_parameterized_title

  validates_attachment_content_type :image, content_type: [
    'image/jpg', 'image/jpeg', 'image/png', 'image/gif'
  ]

  def slug_is_parameterized_title
    title.parameterize == slug
  end

  def for_sale?
    for_sale == true
  end
end
