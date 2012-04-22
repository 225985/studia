module SessionsHelper
  def signin_path_with(provider)
    "/auth/#{provider}"
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
