class User < ActiveRecord::Base
	has_secure_password
	
	validates_presence_of :name, :email

	validates_presence_of :password, on: :create

	validates_length_of :email, :in => 8..512

	validates :email, email: true

	has_many :articles
end
