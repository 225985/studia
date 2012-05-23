class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog

  attr_accessible :content

  validates :user_id, :presence => true
  validates :blog_id, :presence => true
  validates :content, :presence => true, :length => { :maximum => 140 }

  default_scope order: 'posts.created_at DESC'

  # Returns microposts from the users being followed by the given user.
  scope :from_users_followed_by, lambda { |user| followed_by(user) }

  private

    # Returns an SQL condition for users followed by the given user.
    # We include the user's own id as well.
    def self.followed_by(user)
      followed_user_ids = user.followed_user_ids
      where("user_id IN (:followed_user_ids) OR user_id = :user_id",
            { followed_user_ids: followed_user_ids, user_id: user })
    end
end
