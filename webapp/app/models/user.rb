class User < ActiveRecord::Base
  attr_accessible :latitude, :longtitude, :zoom

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.avatar = auth["info"]["image"]
    end
  end

end


# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  provider   :string(255)
#  uid        :string(255)
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  avatar     :string(255)
#  latitude   :float
#  longtitude :float
#  zoom       :integer
#

