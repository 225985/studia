class PostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :fetch_blog


  def create
    if current_user == @blog.user
      @post = @blog.posts.build(params[:post])
      @post.user = current_user
      respond_to do |format|
        if @post.save
          format.html { redirect_to blog_path(@blog)}
        else
          format.html { redirect_to blog_path(@blog)}
        end
      end
    else
      redirect_to blog_path(@blog)
    end  
  end


  def destroy
    if current_user == @blog.user
      @post = Post.find(params[:id])
      @post.destroy
      respond_to do |format|
        format.html { redirect_to blog_path(@blog)}
      end
    else
      redirect_to blog_path(@blog)
    end
  end


  protected
      def fetch_blog
        @blog = Blog.find(params[:blog_id])
      end
end
