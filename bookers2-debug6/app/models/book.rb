class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	#search
    def self.search(search_way,search)
		pp search_way
		pp search
		if search_way == 'forward_match'
			Book.where('title LIKE ?',"#{search}%")
		elsif search_way == 'backward_match'
			Book.where('title LIKE ?',"%#{search}")
		elsif search_way == 'partial_match'
			Book.where('title LIKE ?',"%#{search}%")
		elsif search_way == 'perfect_match'
			Book.where(title: "#{search}")
		  else
			Book.all
		 end
	  end
end
