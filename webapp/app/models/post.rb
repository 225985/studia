class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog

  attr_accessible :content, :user_id

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  default_scope order: 'posts.created_at DESC'
end
