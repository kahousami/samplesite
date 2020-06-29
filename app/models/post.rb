class Post < ApplicationRecord

	belongs_to :user
	has_many :post_category_relations
	has_many :categories, through: :post_category_relations
	has_many :post_comments, dependent: :destroy

	validates :title, presence: true
	validates :content, presence: true
	validates :category_ids, presence: true

	def self.search(search)
		if search
			Post.joins(:post_comments).where(['content LIKE ? OR title LIKE ? OR comment LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
		else
			Post.all
		end
	end

end
