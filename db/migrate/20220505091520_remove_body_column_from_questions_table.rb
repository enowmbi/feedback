class RemoveBodyColumnFromQuestionsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :body, :text
  end
end
