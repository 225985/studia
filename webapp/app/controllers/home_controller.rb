class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:about, :help, :contact]

  def index
  	@blogs = current_user.blogs
  	render :layout => "wall_page"
  end

  def about
  end

  def help
  end

  def contact
  end
end
