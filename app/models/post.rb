class Post < ApplicationRecord
	# when a post gets deleted, then the comments get deleted also!
	has_many :comments, dependent: :destroy 
	belongs_to :user
	validates :title, :body, presence: true 
	validates :title, length: { minimum: 5 }
end
