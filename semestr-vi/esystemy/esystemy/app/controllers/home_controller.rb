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

  def unauthorized
  end


  def user_list
    @users = User.all
    @title = 'User list'
    respond_to do |format|
      format.html { render 'devise/show_follow'}
    end
  end

end
