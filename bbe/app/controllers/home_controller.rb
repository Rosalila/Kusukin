class HomeController < ApplicationController
  
  layout 'frontend/homepage'
  
  def index
    @categories = Category.all
    @courses = Course.all
  end
  
  def go
    redirect_to controller: 'courses'
  end
  
end
