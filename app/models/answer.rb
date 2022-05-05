class Answer < ApplicationRecord
  has_rich_text :body
  belongs_to :question
  has_many :comments, as: :comments
  belongs_to :user
end
