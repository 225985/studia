module Db
  class TasksController < ApplicationController
    before_filter :fetch_project
    # belongs_to :project, :parent_class => Db::Project

    # inherit_resources

    def index
      @tasks = @project.tasks
    end

    def new
      @task = @project.tasks.new
    end

    def create
      Rails.logger.debug Db::Project.all.to_a.inspect
      Rails.logger.debug Db::Task.all.to_a.inspect

      @task = @project.tasks.new(params[:task])
      if @task.save && @project.save
        Rails.logger.debug Db::Project.all.to_a.inspect
        Rails.logger.debug Db::Task.all.to_a.inspect

        redirect_to project_task_path(@project, @task)
      else
        render :new
      end
    end

    def show
      @task = @project.tasks.find(params[:id])
    end

    protected

      def fetch_project
        @project = Project.find(params[:project_id])
      end
  end
end
