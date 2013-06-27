class User < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :user_name, :email, :password, :password_confirmation
  
  validates_uniqueness_of :email
end
