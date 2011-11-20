class Java::Db::Project
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  include Db::Base

  def tasks
    ::ListProxy.new(self, :tasks, :project, Db::Task)
  end
  #
  # def milestones
  #   ::ListProxy.new(self, :milestones, :project, Db::Milestone)
  # end
end
