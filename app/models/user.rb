class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :password_digest, :password, :password_confirmation, :role
  validates :name, :uniqueness => true
end
