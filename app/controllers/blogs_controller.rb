class BlogsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :fetch_blog, :except => [:new, :create]
  before_filter :check_owner, :except => [:show, :new, :create]
  before_filter :check_permission, :only => [:show]

  def show
    @new_post = Post.new
    @user = @blog.user
    @users = User.select { |u| u.id != @user.id }
    @invited = @blog.invitations.collect { |i| i.user }
    respond_to do |format|
      format.html { render :layout => "wall_page" }
      format.json { render :json => @blog }
    end
  end

  def new
    @blog = Blog.new
    respond_to do |format|
      format.html 
      format.json { render :json => @blog }
    end
  end

  def edit
    @users = User.all
  end

  def create
    @blog = current_user.blogs.build(params[:blog])
    
    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, :notice => 'Blog was successfully created.' }
        format.json { render :json => @blog, :status => :created, :location => @blog }
      else
        format.html { render :action => "new" }
        format.json { render :json => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @blog.update_attributes(params[:blog])
        format.html { redirect_to @blog, :notice => 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @blog.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  def add_user
  end

  def remove_user
  end


  protected
      def fetch_blog
        @blog = Blog.find(params[:id])
      end

      def check_owner
        raise Unauthorized if @blog.user != current_user
      end

      def check_permission
        redirect_to unauthorized_path if @blog.kind == 'Discussion' && !@blog.public && !@blog.invited?(current_user) && @blog.user != current_user 
      end
end
