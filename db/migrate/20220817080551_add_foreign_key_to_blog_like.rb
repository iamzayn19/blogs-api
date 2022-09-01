class AddForeignKeyToBlogLike < ActiveRecord::Migration[6.1]
  def change
    change_column :blog_likes, :blog_id, :integer, null: false, foreign_key: true
    change_column :blog_likes, :user_id, :integer, null: false, foreign_key: true
  end
end
