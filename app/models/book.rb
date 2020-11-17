class Book < ApplicationRecord

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}

	belongs_to :user
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	# 投稿画像に付けられた「いいね」に、自分（ログインしているユーザ）が含まれているかをfavorited_by?メソッドで判定しています
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
