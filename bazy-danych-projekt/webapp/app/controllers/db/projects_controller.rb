module Db
  class ProjectsController < ApplicationController
    inherit_resources

    before_filter :authenticate_user!
    before_filter :ensure_user_can_edit_project, :only => [:new, :create, :edit, :update, :destroy]

    def show
      @project = Db::Project.find(params[:id])
      @new_comment = Db::Comment.new
      @new_attachment = Db::Attachment.new
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

    protected

    def ensure_user_can_edit_project
      redirect_to root_path if current_user.can_edit_project
    end
  end
end
