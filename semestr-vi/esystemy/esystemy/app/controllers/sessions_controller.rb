class SessionsController < ::Devise::SessionsController
  before_filter :authenticate_user!
  before_filter :fetch_user
  before_filter :check_permissions, :except => [:show_profile, :following, :followers]

  def show_profile
    @blogs = @user.blogs.find_all{ |blog| blog.kind == "Blog" }
    @discussions = @user.blogs.find_all{ |blog| blog.kind == "Discussion" }
  end

  def edit_pofile
  end

  def delete_profile
    @user.destroy
    redirect_to root_path
  end

  def update_profile
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to profile_path(@user), :notice => 'Profile was successfully updated.' }
      else
        format.html { render :action => "edit_profile" }
      end
    end
  end

  def following
    @title = "Following"
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @users = @user.followers
    render 'show_follow'
  end

  protected

    def fetch_user
      @user = User.find(params[:id]) 
    end

    def check_permissions
      raise Unauthorized if @user != current_user
    end

end