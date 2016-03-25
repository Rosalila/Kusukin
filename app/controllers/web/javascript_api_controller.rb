class Web::JavascriptApiController < ApplicationController
  protect_from_forgery with: :null_session

  def test
    render json: {"status":"You are connected to Kusukin!"}
  end

  def save_progress
    user_id = params[:user_id]
    course_id = params[:course_id]
    progress = params[:progress]

    if User.exists?(id: user_id)==false
      render json: {"status": "Error: User does not exists"}
      return
    end
    if Course.exists?(id: course_id)==false
      render json: {"status": "Error: Course does not exists"}
      return
    end

    ucd=UserCourseStorage.where(:user_id=>user_id,:course_id=>course_id)[0]
    if !ucd
      ucd=UserCourseStorage.new
      ucd.user_id=user_id
      ucd.course_id=course_id
    end
    ucd.json_data=progress.to_json
    ucd.save

    render json: {"status": "success"}
  end

  def get_progress
    user_id = params[:user_id]
    course_id = params[:course_id]

    if User.exists?(id: user_id)==false
      render json: {"status": "Error: User does not exists"}
      return
    end
    if Course.exists?(id: course_id)==false
      render json: {"status": "Error: Course does not exists"}
      return
    end

    ucd=UserCourseStorage.where(:user_id=>user_id,:course_id=>course_id)[0]

    render json: ucd.json_data
  end

  def unlock_achievement
    user_id = params[:user_id]
    achievement_id = params[:achievement_id]

    if User.exists?(id: user_id)==false
      render json: {"status": "Error: User does not exists"}
      return
    end
    if Achievement.exists?(id: achievement_id)==false
      render json: {"status": "Error: Achievement does not exists"}
      return
    end

    user_achievement = UserAchievement.where(:user_id=>user_id,:achievement_id=>achievement_id)[0]
    if !user_achievement
      user_achievement = UserAchievement.new
      user_achievement.user_id = user_id
      user_achievement.achievement_id = achievement_id
    end
    user_achievement.is_unlocked = true
    user_achievement.save

    render json: {"status": "success"}
  end

  def get_achievements
    user = User.find_by_email(params[:email])
    
    if !user
      render json: {"status": "Error: User with the provided email does not exists"}
      return
    end

    achievements=[]
    user.achievements.each do |achievement|
      achievements.push({id: achievement.id,
                          name: achievement.name,
                          description: achievement.description,
                          icon: Refile.attachment_url(achievement, :icon, format: "png")
                        })
    end

    render json: {"achievements": achievements}
  end

  def get_course
    course = Course.find_by_id(params[:course_id])

    if !course
      render json: {"status": "Error: Course does not exists"}
      return
    end

    achievements=[]
    course.achievements.each do |achievement|
      achievements.push({id: achievement.id,
                          name: achievement.name,
                          description: achievement.description,
                          icon: Refile.attachment_url(achievement, :icon, format: "png")
                        })
    end

    sections=[]
    course.sections.each do |section|
      sections.push({id: section.id,
                          name: section.title,
                          video_url: section.videourl,
                          content: section.content
                        })
    end

    render json: {name: course.name, description: course.description, achievements: achievements, sections: sections}
  end
end
