class ArticlesController < ApplicationController
  before_action :set_article, only: %i(show edit update destroy)
  # before_action :authenticate_user!, only: %i(new edit update destroy create)
  require "rexml/document"
  require "open-uri"
  require 'json'

  def index
    @articles = Article.all
    @articles = current_user.favorite_articles if params[:like].present?
    @articles = Article.where(user_id: current_user.id) if params[:mine].present?

    if params[:keyword].present?
      uri = URI.encode("https://app.rakuten.co.jp/services/api/Travel/KeywordHotelSearch/20170426?format=json&keyword=#{params[:keyword]}&applicationId=1059761295941689260")
      res = open(uri)
      code, message = res.status # res.status => ["200", "OK"]
      
      if code == '200'
        @result = ActiveSupport::JSON.decode res.read
        # binding.pry
        # resultを使ってなんやかんや処理をする
      else
        puts "OMG!! #{code} #{message}"
      end
    end

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
    @favorite = current_user.favorites.find_by(article_id: @article.id) if current_user
    @comments = @article.comments
    @comment = Comment.new
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
