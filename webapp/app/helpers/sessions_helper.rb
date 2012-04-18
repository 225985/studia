module SessionsHelper
  def auth_hash
    request.env['omniauth.auth']
  end

  def signin_path_with(provider)
    "/auth/#{provider}"
  end
end
