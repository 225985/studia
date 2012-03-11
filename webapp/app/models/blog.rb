class Blog < ActiveRecord::Base
	belongs_to :user

	attr_accessible :blog_title, :description
end
