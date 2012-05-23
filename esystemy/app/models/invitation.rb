class Invitation < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :blog, :class_name => "Blog"
  belongs_to :user, :class_name => "User"

  validates :blog_id, :presence => true
  validates :user_id, :presence => true 
end
