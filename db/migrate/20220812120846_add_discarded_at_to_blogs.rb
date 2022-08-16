class AddDiscardedAtToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :discarded_at, :datetime
    add_index :blogs, :discarded_at
  end
end
