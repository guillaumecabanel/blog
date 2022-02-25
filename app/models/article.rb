class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  default_scope { where(draft: false) }

  has_rich_text :content
  has_one_attached :main_picture

  validates :slug, uniqueness: true

  def abstract
    content.to_plain_text.truncate(180, separator: ' ')
  end

  def reading_time
    time = content.to_plain_text.split.count / 200
    time <= 1 ? 1 : time
  end
end
