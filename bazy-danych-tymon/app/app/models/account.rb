class Account < ActiveRecord::Base
  attr_accessible :name, :balance, :name_old

  attr_accessor :name_old

  def name_and_balance
    "#{name} (#{balance})"
  end
end
