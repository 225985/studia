class Blog < ActiveRecord::Base
	belongs_to :user
	has_many :posts, :dependent => :destroy

  has_many :invitations, :foreign_key => "blog_id", :dependent => :destroy
  has_many :added_users, :through => :invitations, :source => :user

	attr_accessible :title, :description, :kind, :public

  TYPES = ["Blog", "Discussion"]

  def invited?(other_user)
    invitations.find_by_user_id(other_user.id)
  end

  def invite!(other_user)
    invitations.create!(:user_id => other_user.id)
  end

  def remove!(other_user)
    invitations.find_by_user_id(other_user.id).destroy
  end

end
