class AddUniqueIndexToQuestionTitle < ActiveRecord::Migration[7.0]
  def change
    add_index :questions, :title, unique: true
  end
end
