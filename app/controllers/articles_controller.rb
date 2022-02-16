class ArticlesController < ApplicationController
  def index
    @articles = Article.where(draft: false).order(created_at: :desc).with_rich_text_content
  end

  def show
    @article = Article.friendly.find(params[:id])
  end
end
