class InvitationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :fetch_blog

  def create
    @user = User.find(params[:invitation][:user_id])
    @blog.invite!(@user)
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @user = Invitation.find(params[:id]).user
    @blog.remove!(@user)
    respond_to do |format|
      format.js
    end
  end

  protected
    def fetch_blog
      @blog = Blog.find(params[:blog_id])
    end
end