class User < ActiveRecord::Base
  has_secure_password # Allows me to use authenticate method 
  has_many :recipes
end
