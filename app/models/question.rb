class Question < ApplicationRecord
  has_many :comments, as: :commentable
end
