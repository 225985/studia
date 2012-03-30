class PostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :fetch_blog


  def create
    @post = @blog.posts.build(params[:post])
    @post.user = current_user
    respond_to do |format|
      if @post.save
        flash[:success] = "Micropost created!"
        redirect_to blog_path(@blog)
      else
        format.html { render :action => "new" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end


  protected

      def fetch_blog
        @blog = Blog.find(params[:format])
      end
end
