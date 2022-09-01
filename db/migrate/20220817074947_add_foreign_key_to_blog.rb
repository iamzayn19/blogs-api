class AddForeignKeyToBlog < ActiveRecord::Migration[6.1]
  def change
    change_column :blogs, :user_id, :integer, null: false, foreign_key: true
  end
end
