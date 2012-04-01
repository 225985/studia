module ApplicationHelper
  def title_helper
    base_title = "Fractal Explorer"
    unless @title.nil?
      "#{base_title} | #{@title}"
    else
      base_title
    end
  end
end
