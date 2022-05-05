class Question < ApplicationRecord
  has_many :comments, as: :commentable
  has_many :questions_tags
  has_many :tags, through: :questions_tags
  has_many :answers
end
