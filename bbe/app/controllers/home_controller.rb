class HomeController < ApplicationController
  
  layout 'frontend/homepage'
  
  def index
    @categories = Category.all
    @courses = Course.all
  end
  
end
