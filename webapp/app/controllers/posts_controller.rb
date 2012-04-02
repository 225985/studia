class PostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :fetch_blog
  before_filter :check_owner


  def create
    @post = @blog.posts.build(params[:post])
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to blog_path(@blog) }
      else
        format.html { redirect_to blog_path(@blog) }
      end
    end
  end


  def destroy
    @post = @blog.post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to blog_path(@blog) }
    end
  end


  protected
      def fetch_blog
        @blog = Blog.find(params[:blog_id])
      end

      def check_owner
        raise Unauthorized if @blog.user != current_user
      end
end
