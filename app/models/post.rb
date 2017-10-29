class Post < ApplicationRecord
	validates :title, :body, presence: true 
	validates :title, length: { minimum: 5 }
end
