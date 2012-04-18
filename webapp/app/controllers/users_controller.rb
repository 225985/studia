class UsersController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json

  def update
    if current_user.try :update_attributes, params[:user]
      render :json => { :success => "Update successful" }
    else
      render :json => { :error => "Failed to update location" }
    end
  end
end

