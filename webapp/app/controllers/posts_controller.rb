class PostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :fetch_blog


  def create
    @post = @blog.posts.build(params[:post])
    @post.user = current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to blog_path(@blog)}
      else
        format.html { redirect_to blog_path(@blog)}
      end
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to blog_path(@blog)}
    end
  end


  protected
      def fetch_blog
        @blog = Blog.find(params[:blog_id])
      end
end
