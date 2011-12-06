module Db
  class MilestonesController < ApplicationController
    before_filter :fetch_project


    def new
      @milestone = @project.milestones.new
      @milestone.deadline ||= Time.now
    end

    def create
      @milestone = Db::Milestone.new(params[:java_db_milestone])
      @milestone = @project.create_milestone @milestone
      if @milestone
        redirect_to project_milestone_path(@project, @milestone)
      else
        render :new
      end
    end

    def show
      @milestone = Db::Milestone.find(params[:id])
      @new_comment = Db::Comment.new
      @new_attachment = Db::Attachment.new
    end

    def edit
      @milestone = Db::Milestone.find(params[:id])
    end

    def update
      @milestone = Db::Milestone.find(params[:id])
      if @milestone.update_attributes(params[:java_db_milestone])
        redirect_to project_milestone_path(@project, @milestone)
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
