class ProfileAdmin < ActiveRecord::Base
  belongs_to :admin

  attr_accessible :first_name, :last_name
  # attr_accessible :title, :body
end
