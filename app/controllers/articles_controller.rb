class ArticlesController < ApplicationController
  def index
    @articles = Article.order(published_at: :desc).with_rich_text_content
    @transform_options = {
      resize_to_limit: [600, 600],
      format: :webp,
      saver: { subsample_mode: "on", strip: true, interlace: true, quality: 80 }
    }
  end

  def show
    @article = Article.friendly.find(params[:id])
    @transform_options = {
      resize_to_limit: [1024, 384],
      format: :webp,
      saver: { subsample_mode: "on", strip: true, interlace: true, quality: 80 }
    }
  end
end
