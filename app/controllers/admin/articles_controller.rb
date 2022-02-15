module Admin
  class ArticlesController < AdminController
    def index
      @articles = Article.all
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
      @article = Article.find(params[:id])
    end

    def update
      @article = Article.find(params[:id])
      @article.draft = params[:button] == "draft"

      if @article.update(article_params)
        redirect_to admin_articles_path
      else
        render :edit
      end
    end

    private

    def article_params
      params.require(:article).permit(:title, :content)
    end
  end
end
