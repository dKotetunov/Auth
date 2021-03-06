class User < ActiveRecord::Base
  include Authorization

  attr_accessible :email, :password, :password_confirmation, :username

  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  has_one :profile
  has_one :role

end


