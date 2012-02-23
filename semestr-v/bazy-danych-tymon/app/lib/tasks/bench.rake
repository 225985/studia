require "benchmark"

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

task :bench => :environment do
  a,b = Account.all.take(2)

  n = 100
  k = 10

  Benchmark.bmbm do |x|
    x.report("plain      ") do
      disable_transactions!

      n.times do |i|
        k.times do |j|
          a.update_attributes(:balance => i+j)
          b.update_attributes(:balance => i+j)
        end
      end
    end

    x.report("transaction") do
      enable_transactions!

      n.times do |i|
        Account.transaction do
          k.times do |j|
            a.update_attributes(:balance => i+j)
            b.update_attributes(:balance => i+j)
          end
        end
      end
    end
  end
end
