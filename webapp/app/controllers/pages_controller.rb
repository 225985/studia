class PagesController < ApplicationController
  def home
    if !current_user.nil?
      @size = current_user.size
      @iter = current_user.iter
      @kind = current_user.kind
    else
      @size = 256
      @iter = 1000
      @kind = "mandelbrot"
    end
  end

  def about
  end
end
