class ChangeUserTypeInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :user_type, :integer, null: false
  end
end
