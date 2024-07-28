class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games, dependent: :destroy
  has_many :newgames, dependent: :destroy
  has_many :posts, dependent: :destroy

  # フォローをした、されたの関係
    has_many :followers, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    has_many :followeds, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  
    # 一覧画面で使う
    has_many :following_users, through: :followers, source: :followed
    has_many :follower_users, through: :followeds, source: :follower
  

  attachment :profile_image

  with_options presence: true do
    validates :username
    validates :usernumber
    validates :email
  end

  # フォローしたときの処理
  def follow(user_id)
    followers.create(followed_id: user_id)
  end
# フォローを外すときの処理
  def unfollow(user_id)
    followers.find_by(followed_id: user_id).destroy
  end
# フォローしているか判定
  def following?(user)
    following_users.include?(user)
  end

end
