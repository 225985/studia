class SessionsController < ::Devise::SessionsController
  # layout "admin"
  # the rest is inherited, so it should work

  def destroy
    session["warden.user.db_user.key"] = nil
    redirect_to "/"
  end
end
