class ChangeDefaultForConfirmedInUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :confirmed, :boolean, :default => false
  end
end
