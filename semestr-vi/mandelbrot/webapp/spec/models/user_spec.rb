require 'spec_helper'

describe User do
  pending "add some examples to (or delete) #{__FILE__}"
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
#  kind       :string(255)     default("mandelbrot")
#  iter       :integer         default(1000)
#  size       :integer         default(256)
#

