module Db
  class ProjectsController < ApplicationController
    inherit_resources

    before_filter :authenticate_user!
    before_filter :ensure_user_can_edit_project, :only => [:new, :create, :edit, :update, :destroy]

    def show
      @project = Db::Project.find(params[:id])

      respond_to do |format|
        format.html do
          @new_comment = Db::Comment.new
          @new_attachment = Db::Attachment.new

          @assigned_users = @project.all_users.to_a
          @not_assigned_users = Db::User.all.to_a - @assigned_users
        end

        format.js do
          render :json => @project.tasks.map {|e| e.time_entries }.group_by {|te| te.user }.map do |user, entries|
            {
              "name" => user.name,
              "desc" => "",
              "values" => entries.map {|e|
                {
                  "from" => e.start_time,
                  "to" => e.end_time,
                  "desc" => e.task.name
                }
              }
            }
          end
        end
      end
    end

    def create
      @project = Db::Project.new(params[:java_db_project])
      @project.owner = current_user
      if @project.save
        redirect_to project_path(@project)
      else
        render :new
      end
    end

    def add_user
      @project = Db::Project.find(params[:id])
      @user = Db::User.find(params[:user_id])
      @project.addUser(@user)
      @user.addProject(@project)
      @project.save
      @user.save
      redirect_to project_path(@project, :anchor => "users")
    end

    def remove_user
      @project = Db::Project.find(params[:id])
      @user = Db::User.find(params[:user_id])
      @project.removeUser(@user)
      @user.removeProject(@project)
      @project.save
      @user.save
      redirect_to project_path(@project, :anchor => "users")
    end

    protected

    def ensure_user_can_edit_project
      redirect_to root_path unless current_user.can_edit_project
    end
  end
end
