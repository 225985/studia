module Db
  class CommentsController < ApplicationController
    inherit_resources

    before_filter :authenticate_user!
    before_filter :fetch_parent

    def create
      @comment = Db::Comment.new(params[:java_db_comment])
      @comment.author = current_user
      if @comment.save
        @parent.addComment(@comment)
        redirect_to @r.call(@parent)
      else
        render :new
      end
    end

    protected

    def fetch_parent
      id_key,v = {
        :task_id      => [Db::Task,      lambda {|t| project_task_path(t.project ,t) }],
        :milestone_id => [Db::Milestone, lambda {|m| project_milestone_path(m.project, m) }],
        :project_id   => [Db::Project,   lambda {|p| project_path(p) }]
      }.find {|k,cls| params[k] }
      cls, @r = v
      @parent = cls.find(params[id_key])
    end
  end
end
