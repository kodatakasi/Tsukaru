class User < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_articles, through: :favorites, source: :article
  has_many :active_relationships, class_name:  "Relationship",
                                 foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "followed_id",
                                    dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :comments, dependent: :destroy
  
  validates :name, presence: true, length: { maximum: 30 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  # ユーザーをフォローする
  def follow!(other_user)
    active_relationships.create!(followed_id: other_user.id)
  end
  
  # ユーザーをアンフォローする
  def unfollow!(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  
  # 現在のユーザーがフォローしてたらtrueを返す
  def following?(other_user)
    active_relationships.find_by(followed_id: other_user.id)
  end

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
