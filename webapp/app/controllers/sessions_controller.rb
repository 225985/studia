class SessionsController < ApplicationController
  include SessionsHelper

  def create
    user = User.find_by_provider_and_uid auth_hash["provider"], auth_hash["uid"]
    user ||= User.create_with_omniauth auth_hash
    session[:user_id] = user.id

    redirect_to root_path, :notice => "Signed in!"
  end

  def failure
    flash[:error] = "Failed to authenticate!" unless current_user
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Signed out!"
  end
end
