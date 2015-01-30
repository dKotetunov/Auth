class Role < ActiveRecord::Base
  attr_accessible :name, :admin_id
  belongs_to :admin
  belongs_to :user
end
