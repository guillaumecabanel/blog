class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_rich_text :content
  has_one_attached :main_picture

  validates :slug, uniqueness: true

end
