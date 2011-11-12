class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :commit_db

  protected

  def commit_db
    Db::Database.commit
  end
end
