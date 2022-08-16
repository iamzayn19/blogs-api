class AddNotNullToBlogs < ActiveRecord::Migration[6.1]
  def change
    change_column :blogs, :title, :string, null: false
    change_column :blogs, :body, :text, null: false
    change_column :blogs, :user_id, :integer, null: false
  end
end
