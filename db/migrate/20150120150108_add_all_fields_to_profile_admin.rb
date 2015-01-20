class AddAllFieldsToProfileAdmin < ActiveRecord::Migration
  def change
    add_column :profile_admins, :admin_id, :integer
    add_column :profile_admins, :first_name, :string
    add_column :profile_admins, :last_name, :string
  end
end
