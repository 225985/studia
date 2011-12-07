module Db
  class TasksController < ApplicationController
    before_filter :fetch_project
    # belongs_to :project, :parent_class => Db::Project
    before_filter :ensure_user_can_edit_task, :only => [:new, :create, :edit, :update, :destroy]


    # inherit_resources

    def index
      @tasks = @project.tasks
    end

    def new
      @task = @project.tasks.new
      @task.deadline ||= Time.now
      # @task.milestone = Db::Milestone.find(params[:milestone_id]) if params[:milestone_id]
    end

    def create
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
      @new_comment = Db::Comment.new
      @new_attachment = Db::Attachment.new
    end

    def edit
      @task = @project.tasks.find(params[:id])
    end

    def update
      @task = @project.tasks.find(params[:id])
      @task.update_attributes(params[:java_db_task])
      # logger.debug params[:java_db_task].inspect
      # logger.debug @task.inspect
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

      def ensure_user_can_edit_task
        redirect_to root_path if current_user.can_edit_task
      end
  end
end
