class Answer < ApplicationRecord
  has_rich_text :body
  belongs_to :question
end
