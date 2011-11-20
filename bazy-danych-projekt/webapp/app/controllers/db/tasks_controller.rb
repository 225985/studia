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

      @task = Db::Task.new(params[:java_db_task])
      @project.create_task @task

      # @task = Db::Task.new(params[:java_db_task])
      # @project.create_task @task

      if true
        # Rails.logger.debug Db::Project.all.to_a.inspect
        # Rails.logger.debug Db::Task.all.to_a.inspect

        redirect_to project_task_path(@project, @task)
      else
        render :new
      end
    end

    def show
      @task = @project.tasks.find(params[:id])
    end

    def edit
      @task = @project.tasks.find(params[:id])
    end

    def update
      @task = @project.tasks.find(params[:id])
      @task.update_attributes(params[:java_db_task])
      logger.debug params[:java_db_task].inspect
      logger.debug @task.inspect
      if true
        redirect_to project_task_path(@project, @task)
      else
        render :edit
      end
    end


    protected

      def fetch_project
        @project = Project.find(params[:project_id])
      end
  end
end
