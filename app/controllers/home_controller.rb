class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:about, :help, :contact]

  def index
  	@blogs = current_user.blogs.find_all{ |blog| blog.kind == "Blog" }
    @discussions = current_user.blogs.find_all{ |blog| blog.kind == "Discussion" }
    @feeds = current_user.feed
  	render :layout => "wall_page"
  end

  def about
  end

  def help
  end

  def contact
  end

  def user_list
    @usernames = User.all
    respond_to do |format|
      format.html { render 'user_list'}
      format.json { render :json => @usernames.collect { |u| u.fullname}}
    end
  end

end
