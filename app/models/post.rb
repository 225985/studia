class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog

  attr_accessible :content

  validates :user_id, :presence => true
  validates :blog_id, :presence => true
  validates :content, :presence => true, :length => { :maximum => 140 }

  def self.from_users_followed_by(user)
    followed_user_ids = user.followed_user_ids.join(', ')
    where("user_id IN (?)", followed_user_ids)
  end
end
