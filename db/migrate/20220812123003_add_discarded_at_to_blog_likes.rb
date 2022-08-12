class AddDiscardedAtToBlogLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :blog_likes, :discarded_at, :datetime
    add_index :blog_likes, :discarded_at
  end
end
