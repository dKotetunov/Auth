class Admin < ActiveRecord::Base
  include AuthorizationAdmin
  attr_accessible :email, :password, :password_confirmation, :username

  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  has_one :profile_admin
  has_one :role

  def role?(role)
     self.role.name == role
  end

end
