class HomeController < ApplicationController
  layout 'frontend/homepage', only: [:index]
  
  def index
    @categories = Category.all
    @courses = Course.all
  end

end
