class ArticlesController < ApplicationController
  def index
    @articles = Article.where(draft: false).order(published_at: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end
end
