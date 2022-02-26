module Admin
  class ArticlesController < AdminController
    before_action :set_article, only: %i[ edit update destroy ]

    def index
      @articles = Article.unscoped.all.order(created_at: :desc)
    end

    def show
      @article = Article.unscoped.find(params[:id])
      @transform_options = {
        resize_to_limit: [1024, 384],
        format: :webp,
        saver: { subsample_mode: "on", strip: true, interlace: true, quality: 80 }
      }

      render "articles/show"
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      @article.draft = params[:button] == "draft"
      @article.published_at = DateTime.now unless @article.draft

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
      @article.published_at = DateTime.now unless @article.draft

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
