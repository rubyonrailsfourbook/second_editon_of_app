class Article < ActiveRecord::Base
  attr_accessor :tag_list
  
  belongs_to :user

	has_many :taggings
	has_many :tags, through: :taggings

  validates_presence_of :name, :content
  
  def self.tagged_with(name)
  	Tag.find_by_name(name).articles
  end

  def tag_list
  	tags.map(&:name).join(",")
  end

  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end
end
