require File.join(Rails.root, "..", "target", "db.jar")

module Db
  include_package "db"

  Models = [Task]

  Models.each do |model|
    puts model.inspect
  end
end

Dir[File.join(Rails.root, "app", "models", "db", "*.rb")].each {|f| require f }

Db::Database.init("/tmp/rails_odb_#{rand(100000)}.neodatis")
