class RemoveColumnFromAnswers < ActiveRecord::Migration[7.0]
  def change
    remove_column :answers, :Body, :text
  end
end
