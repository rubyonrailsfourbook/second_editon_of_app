class User < ActiveRecord::Base
	has_secure_password
	
	validates_presence_of :name, :email, :password

	has_many :posts
end
