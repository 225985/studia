module PagesHelper
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
    else "alert-#{type}"
    end
  end

end
