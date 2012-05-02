class Blog < ActiveRecord::Base
	belongs_to :user
	has_many :posts, :dependent => :destroy

	attr_accessible :title, :description, :kind, :public

  TYPES = ["Blog", "Discussion"]
end
