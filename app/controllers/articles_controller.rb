class ArticlesController < ApplicationController
  before_action :set_article, only: %i(show edit update destroy)
  # before_action :authenticate_user!, only: %i(new edit update destroy create)
  require "rexml/document"
  require "open-uri"
  require 'json'

  def index
    @articles = Article.page(params[:page]).per(10).order(id: "DESC")
    @articles = current_user.favorite_articles.page(params[:page]).per(10) if params[:like].present?
    @articles = Article.where(user_id: current_user.id).page(params[:page]).per(10) if params[:mine].present?

    if params[:keyword].present?
      uri = URI.encode("https://app.rakuten.co.jp/services/api/Travel/KeywordHotelSearch/20170426?format=json&keyword=#{params[:keyword]}&applicationId=1059761295941689260")
      res = open(uri)
      code, message = res.status # res.status => ["200", "OK"]
      
      if code == '200'
        @result_hotel = ActiveSupport::JSON.decode res.read
      else
        puts "OMG!! #{code} #{message}"
      end
    end

  end

  def search
    @onsen = Onsen.new

    if params[:number].present?
      uri = ("http://jws.jalan.net/APICommon/OnsenSearch/V1/?key=leo16e3956ee01&pref=#{params[:prefectures]}&onsen_q=#{params[:number]}&count=60&xml_ptn=1")
      res = open(uri)
      code, message = res.status # res.status => ["200", "OK"]
      
      if code == '200'
        doc = REXML::Document.new(open(uri).read)
        @result_onsen = Hash.from_xml(doc.to_s)
      else
        puts "OMG!! #{code} #{message}"
      end
    end
  end

  def new
    @article = Article.new
    @article.build_onsen
    @onsen = Onsen.new(name: params[:name], prefectures: params[:prefectures], quality: params[:quality], infomation: params[:infomation])
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
    params.require(:article).permit(:title, :content, :picture, :user_id, onsen_attributes: [:name, :prefectures, :quality, :infomation, :article_id])
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
