class Tag < ActiveRecord::Base
	validates_presence_of :name

	has_many :taggings
	has_many :articles, through: :taggings
end
