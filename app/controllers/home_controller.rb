class HomeController < ApplicationController
  layout 'frontend/homepage', only: [:index]
  layout 'backend/dashboard'
  
  def index
    @categories = Category.all
    @courses = Course.all
  end

  def profile
    @user = User.find_by_id(params[:id])
  end

end
