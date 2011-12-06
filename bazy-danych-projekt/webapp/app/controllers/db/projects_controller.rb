module Db
  class ProjectsController < ApplicationController
    inherit_resources

    before_filter :authenticate_user!
	
	def show
		@project = Db::Project.find(params[:id])
		@new_comment = Db::Comment.new
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
  end
end
