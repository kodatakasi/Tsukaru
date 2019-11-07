class ArticlesController < ApplicationController
  before_action :set_article, only: %i(show edit update destroy)
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
    redirect_to articles_path, notice: "投稿しました！"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: '編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: '削除しました！'
  end

  private
  def article_params
    params.require(:article).permit(:title, :content, :image, :image_cache)
  end
  def set_article
    @article = Article.find(params[:id])    
  end
end
