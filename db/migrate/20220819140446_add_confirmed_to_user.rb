class AddConfirmedToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :confirmed, :boolean
  end
end
