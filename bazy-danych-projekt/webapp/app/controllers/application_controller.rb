class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :open_db
  # after_filter :close_db

  protected


  def open_db
    Db::Database.init("db/dev.neodatis")
  end

  # def close_db
  #   Db::Database.commit
  #   Db::Database.close
  # end
end
