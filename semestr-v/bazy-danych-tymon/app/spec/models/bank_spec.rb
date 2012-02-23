require 'spec_helper'

def disable_transactions!
  ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.class_eval do
    def begin_db_transaction
      # execute "BEGIN"
    end

    def commit_db_transaction
      # execute "COMMIT"
    end
  end
end

def enable_transactions!
  ActiveRecord::ConnectionAdapters::PostgreSQLAdapter.class_eval do
    def begin_db_transaction
      execute "BEGIN"
    end

    def commit_db_transaction
      execute "COMMIT"
    end
  end
end

describe Bank do
  before do
    disable_transactions!
    Account.delete_all
  end

  it "should allow transfer" do
    a1 = Account.create(:name => "Account 1", :balance => 100)
    a2 = Account.create(:name => "Account 2", :balance => 100)

    Bank.transfer a1, a2, 20

    a1.reload
    a2.reload

    a1.balance.should == 80
    a2.balance.should == 120
  end

  it "should not allow transfer" do
    a1 = Account.create(:name => "Account 1", :balance => 100)
    a2 = Account.create(:name => "Account 2", :balance => 100)

    Bank.transfer a1, a2, 130

    a1.reload
    a2.reload

    a1.balance.should == 100
    a2.balance.should == 100
  end

end
