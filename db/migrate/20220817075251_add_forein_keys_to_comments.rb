class AddForeinKeysToComments < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :user_id, :integer, null: false, foreign_key: true
    change_column :comments, :blog_id, :integer, null: false, foreign_key: true
  end
end
