module Admin
  class ArticlesController < AdminController
    before_action :set_article, only: %i[ edit update destroy ]

    def index
      @articles = Article.all.order(created_at: :desc)
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      @article.draft = params[:button] == "draft"

      if @article.save
        redirect_to admin_articles_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      @article.draft = params[:button] == "draft"

      if @article.update(article_params)
        redirect_to admin_articles_path
      else
        render :edit
      end
    end

    def destroy
      @article.destroy

      redirect_to admin_articles_path
    end

    private

    def article_params
      params.require(:article).permit(:title, :content, :main_picture)
    end

    def set_article
      @article = Article.find(params[:id])
    end
  end
end
