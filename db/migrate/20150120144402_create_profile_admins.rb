class CreateProfileAdmins < ActiveRecord::Migration
  def change
    create_table :profile_admins do |t|
      t.string :last_name
      t.string :first_name
      t.timestamps
    end
  end
end
