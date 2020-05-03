class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,:trackable,:validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :follower, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :followed, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  attachment :profile_image, destroy: false

  #バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
  validates :name,presence: true, length: {maximum: 20, minimum: 2}
  validates :introduction, length: { maximum:50 }

  # ユーザーをフォローする
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す
  def following?(user)
    following_user.include?(user)
  end

  #search
   def self.search(search_way,search)
          if search_way == 'forward_match'
               User.where('name LIKE ?',"#{search}%")
          elsif search_way == 'backward_match'
               User.where('name LIKE ?',"%#{search}")
          elsif search_way == 'backward_match'
               User.where('name LIKE ?',"%#{search}%")
          elsif search_way == 'perfect_match'
               User.where(name: "#{search}")
          else
               User.all
          end
  end

end
