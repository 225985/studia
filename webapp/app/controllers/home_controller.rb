class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:about, :help, :contact]

  def index
  end

  def about
  end

  def help
  end

  def contact
  end
end
