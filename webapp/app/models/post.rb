class Post < ActiveRecord::Base
	belongs_to :user, :blog

	attr_accessible :content, :user_id
end
