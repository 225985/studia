module ApplicationHelper
  def title(page_title)
    content_for :title do
      page_title
    end
  end

  def bootstrap_flash_class(type)
    case type
    when :alert then "alert-warning"
    when :error then "alert-error"
    when :notice then "alert-info"
    when :success then "alert-success"
    else "alert-#{type.to_s}"
    end
  end

  def current_user
    @current_user ||= User.find session[:user_id] if session[:user_id]
  end

  def user_signed_in?
    !!@current_user
  end

  def current_user_hash
    [:latitude, :longtitude, :zoom].reduce({}) do |a, o|
      a.merge o => current_user.try(o)
    end
  end

  def signin_path_with(provider)
    "/auth/#{provider}"
  end

end
