require "rubygems"
require "sequel"
require "logger"
require "logger/colors"
require "benchmark"

DBNAME = "sem_test"

system "dropdb #{DBNAME}" rescue nil
system "createdb #{DBNAME}"

# class XLogger
#   @logger = Logger.new($stdout)
#
#   def self.method_missing(name, *args, &block)
#     if args.size == 1 && args.first.is_a?(String)
#       args.first.split("\n").each do |arg|
#         @logger.send(name, arg, &block)
#       end
#     else
#       @logger.send(name, *args, &block)
#     end
#   end
# end
#
# def log(*args)
#   XLogger.debug(*args)
# end


DB = Sequel.connect("postgres://localhost/#{DBNAME}")
# DB.loggers << Logger.new($stderr)

accounts = DB[:accounts]

# DB.loggers << XLogger

setup = lambda do
  DB.drop_table :accounts rescue nil

  DB.create_table :accounts do
    primary_key :id
    String :name
    Integer :balance
    # check { balance > 0 }
  end

  accounts.truncate

  10000.times do |i|
    # accounts.insert(:name => "Account #{i}", :balance => 100)
  end
  # accounts.insert(:name => "Account 2", :balance => 100)
  # puts
  # puts
  # puts
end


setup.call


n = 10000
k = 1


Benchmark.bmbm do |x|
  x.report("transaction") do
    n.times do |i|
      DB.execute <<-EOS
        BEGIN;
        SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
        --UPDATE "accounts" SET "balance" = #{i} WHERE ("id" = #{i+1});
        INSERT INTO "accounts" VALUES (#{n+i+1}, 'Foo');
        COMMIT;
      EOS
    end
  end

  x.report("plain      ") do
    n.times do |i|
      DB.execute <<-EOS
        --UPDATE "accounts" SET "balance" = #{i} WHERE ("id" = #{i+1});
        INSERT INTO "accounts" VALUES (#{i+1}, 'Foo');
      EOS
    end
  end

end
