class AddNonNullConstraintToQuestions < ActiveRecord::Migration[7.0]
  def change
    change_column :questions, :title, :string, null: false
    change_column :questions, :body, :text, null: false
  end
end
