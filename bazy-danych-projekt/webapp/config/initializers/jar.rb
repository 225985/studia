require File.join(Rails.root, "..", "target", "db.jar")

module Db
  include_package "db"

  Models = [Task, Project]

  Models.each do |model|
    puts model.inspect
  end
end

Dir[File.join(Rails.root, "app", "models", "db", "*.rb")].each {|f| require f }

Db::Database.init("/tmp/rails_odb_#{rand(100000)}.db4o")

# Temporary seed
#
# Project.create(:name => "Project A").tap do |project|
#   m1 = project.milestones.create(:name => "Milestone A1")
#   m2 = project.milestones.create(:name => "Milestone A2")
#
#   project.tasks.create(:name => "Task A1")
#   project.tasks.create(:name => "Task A2", :milestone => m1)
#   project.tasks.create(:name => "Task A3", :milestone => m2)
# end
#
# Project.create(:name => "Project B")
# Project.create(:name => "Project C")
#
