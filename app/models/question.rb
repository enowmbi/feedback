class Question < ApplicationRecord
  has_rich_text :body

  has_many :comments, as: :commentable

  has_many :questions_tags
  has_many :tags, through: :questions_tags
  
  has_many :answers

  belongs_to :user
end
