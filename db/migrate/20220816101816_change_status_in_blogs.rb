class ChangeStatusInBlogs < ActiveRecord::Migration[6.1]
  def change
    change_column :blogs, :status, :integer, null: false
  end
end
