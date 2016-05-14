class Web::HomeController < ApplicationController
  def index
    @categories = Category.all
    @courses = Course.all

    render layout: 'frontend/homepage'
  end

  def profile
    @user = User.find_by_id(params[:id])
    render layout: 'backend/dashboard'
  end
end
