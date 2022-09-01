class AddUniquenessToUserEmail < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :email, :string, unique: true
  end
end
