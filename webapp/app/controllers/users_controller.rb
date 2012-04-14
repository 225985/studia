class UsersController < ApplicationController
  include ApplicationHelper
  respond_to :json

  def update
    if current_user.try :update_attributes, params[:user]
      render :json => { :msg => "Update successful" }
    else
      render :json => { :msg => "Failed to update location" }
    end
  end
end

