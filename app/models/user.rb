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

  def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create( name:     auth.extra.raw_info.name,
                          provider: auth.provider,
                          uid:      auth.uid,
                          email:    auth.info.email,
                          token:    auth.credentials.token,
                          password: Devise.friendly_token[0,20] )
    end

    user
  end

  private
  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
