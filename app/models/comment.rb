class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user 
  validates :name, :body, presence: true 
end
