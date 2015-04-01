class HomeController < ApplicationController
  
  layout 'frontend/homepage'
  
  def index
    @categories = Category.all
    @courses = Course.all
  end
  
  def show
    e = Enrollment.new
    e.user_id = current_user.id
    e.course_id = 1
    e.progress = 10
    
    if e.save
      #redirect_to 'www.google.hn'
      redirect_to controller: 'courses'
    else
      render('index')
    end
  end

end
