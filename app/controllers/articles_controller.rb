class ArticlesController < ApplicationController
  before_action :set_article, only: %i(show edit update destroy)
  # before_action :authenticate_user!, only: %i(new edit update destroy create)
  def index
    @articles = Article.all
    @articles = current_user.favorite_articles if params[:like].present?
    @articles = Article.where(user_id: current_user.id) if params[:mine].present?
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
    redirect_to articles_path, notice: "投稿しました！"
    else
      render :new
    end
  end

  def show
    @favorite = current_user.favorites.find_by(article_id: @article.id)
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
    params.require(:article).permit(:title, :content, :picture, :user_id)
  end
  def set_article
    @article = Article.find(params[:id])    
  end
end
