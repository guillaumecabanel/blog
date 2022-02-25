class PagesController < ApplicationController
  def home
    @articles = Article.where(draft: false).order(published_at: :desc).limit(3).with_rich_text_content
    @transform_options = {
      resize_to_limit: [500, 500],
      format: :webp,
      saver: { subsample_mode: "on", strip: true, interlace: true, quality: 80 }
    }
  end

  def about
  end
end
