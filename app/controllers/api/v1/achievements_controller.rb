class Api::V1::AchievementsController < Api::V1::ApplicationController
  protect_from_forgery with: :null_session

  def unlock
    user_id = current_user.id
    achievement_id = params[:achievement_id]

    unless User.exists?(id: user_id)
      render json: { error: 'User does not exists' }
      return
    end
    unless Achievement.exists?(id: achievement_id)
      render json: { error: 'Achievement does not exists' }
      return
    end

    user_achievement = UserAchievement.find_by(user_id: user_id, achievement_id: achievement_id)
    unless user_achievement
      user_achievement = UserAchievement.new
      user_achievement.user_id = user_id
      user_achievement.achievement_id = achievement_id
    end
    user_achievement.is_unlocked = true
    user_achievement.save

    render json: { status: 'success' }
  end

  def index
    user = User.find_by_id(params[:id])

    unless user
      render json: { error: 'User does not exists' }
      return
    end

    achievements = []
    user.achievements.each do |achievement|
      achievements.push({id: achievement.id,
                        name: achievement.name,
                        description: achievement.description
                        #icon: Refile.attachment_url(achievement, :icon, format: "png")
                        })
    end

    render json: { "achievements": achievements }
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end
end
