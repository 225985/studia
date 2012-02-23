module Db
  class AttachmentsController < ApplicationController
    inherit_resources

    before_filter :authenticate_user!
    before_filter :fetch_parent

    def create
      @attachment = Db::Attachment.new(params[:java_db_attachment])
      @attachment.author = current_user
      @attachment.write_file_identifier
      Rails.logger.debug "KURWA"
      Rails.logger.debug "KURWA"
      Rails.logger.debug "KURWA"
      Rails.logger.debug @attachment.file
      Rails.logger.debug @attachment.get_file
      Rails.logger.debug @attachment.instance_variable_get(:"@file")
      Rails.logger.debug "KURWA"
      Rails.logger.debug "KURWA"
      Rails.logger.debug "KURWA"
      if @attachment.save
        @attachment.store_file!

        @parent.addAttachment(@attachment)
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
