class Article < ApplicationRecord
  has_one_attached :picture, dependent: :destroy
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  has_one :onsen, dependent: :destroy, inverse_of: :article
  accepts_nested_attributes_for :onsen, allow_destroy: true

  validates :title, presence: true, length: { maximum: 60 }
  validates :content, presence: true, length: { maximum: 10000 }

  def self.display_article(params, current_user)
    if params[:label_id].present?
      joins(:labels).where(labels: { id: params[:label_id] }).page(params[:page])
    elsif params[:like].present?
      current_user.favorite_articles.page(params[:page])
    elsif params[:mine].present?
      where(user_id: current_user.id).page(params[:page])
    elsif params[:keyword].present?
      uri = URI.encode("https://app.rakuten.co.jp/services/api/Travel/KeywordHotelSearch/20170426?format=json&keyword=#{params[:keyword]}&applicationId=1059761295941689260")
      begin
        res = open(uri)
        code, message = res.status # res.status => ["200", "OK"]
        if code == '200'
          @result_hotel = ActiveSupport::JSON.decode res.read
        end
      rescue => e
        @result_hotel = nil
        @error = '検索結果がありません'
      end
    else
      @search = Article.ransack(params[:q])
      @search.sorts = "created_at desc" if @search.sorts.empty?
      return @search.result.page(params[:page])
    end
  end

end
