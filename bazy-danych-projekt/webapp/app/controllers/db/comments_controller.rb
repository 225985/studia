module Db
  class CommentsController < ApplicationController
    inherit_resources

    before_filter :authenticate_user!
    before_filter :fetch_task

    def create
      @comment = Db::Comment.new(params[:java_db_comment])
      @comment.author = current_user
      if @comment.save
        @task.addComment(@comment)
        redirect_to project_task_path(@task.project, @task)
      else
        render :new
      end
    end

    protected

    def fetch_task
      @task = Db::Task.find(params[:task_id])
    end
  end
end
