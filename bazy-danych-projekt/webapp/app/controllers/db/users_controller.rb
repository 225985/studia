module Db
  class UsersController < ApplicationController
    inherit_resources

    before_filter :authenticate_user!

    def create
      @user = Db::User.new(params[:java_db_user])
      if @user.save
        redirect_to user_path(@user)
      else
        render :new
      end
    end

    def update
      @user = Db::User.find(params[:id])
      if @user.update_attributes(params[:java_db_user])
        redirect_to users_path
      else
        render :edit
      end
    end
  end
end
