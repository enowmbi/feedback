class AddBodyToAnswer < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :Body, :text
  end
end
