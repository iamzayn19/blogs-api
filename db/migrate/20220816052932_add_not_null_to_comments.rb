class AddNotNullToComments < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :text, :text, null: false
    change_column :comments, :user_id, :integer, null: false
    change_column :comments, :blog_id, :integer, null: false
  end
end
