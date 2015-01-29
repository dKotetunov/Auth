class RemoveRoleIdFromAdmins < ActiveRecord::Migration
  def change
    remove_column :admins, :role_id
  end
end
