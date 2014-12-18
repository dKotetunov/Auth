class AddLastNameAndFirstNameToProfile < ActiveRecord::Migration
  def change

    add_column :profile, :first_name, :string
    add_column :profile, :last_name, :string
  end
end
