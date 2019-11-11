class User < ApplicationRecord
  has_one_attached :image
  has_many :articles
  has_many :favorites, dependent: :destroy
  has_many :favorite_articles, through: :favorites, source: :article
  
  validates :name, presence: true, length: { maximum: 30 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20] # ランダムなパスワードを作成
      # user.image = auth.info.image.gsub("_normal","") if user.provider == "twitter"
      user.image = auth.info.image.gsub("picture","picture?type=large") if user.provider == "facebook"
    end
  end

  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
