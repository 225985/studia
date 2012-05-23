module UsersHelper
  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end

  def user_signed_in?
    !!current_user
  end

  def current_user_hash
    [:id, :latitude, :longtitude, :zoom].reduce({}) do |a, o|
      a.merge o => current_user.try(o)
    end
  end

  private
  def authenticate_user!
    unless user_signed_in?
      respond_to do |format|
        format.html { redirect_to root_path, :error => "Sign in required!" }
        format.json { render :json => { :error => "Unauthorized" } }
      end
    end
  end

end
