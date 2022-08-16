class DropTableSuperAdmins < ActiveRecord::Migration[6.1]
  def change
    drop_table :super_admins
  end
end
