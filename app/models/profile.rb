class Profile < ActiveRecord::Base
  belongs_to :user
  attr_accessible :first_name, :last_name
  # attr_accessible :title, :body
end
