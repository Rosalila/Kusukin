class Api::V1::AchievementsController < Api::V1::ApplicationController
  protect_from_forgery with: :null_session

  def unlock
    achievement_id = params[:achievement_id]
    user = User.find_by(authentication_token: [params[:user_token]], email: [params[:user_email]])
    achievement = Achievement.find_by(id: achievement_id)

    unless user
      render json: { error: 'User does not exists' }, status: :unprocessable_entity
      return
    end
    unless achievement
      render json: { error: 'Achievement does not exists' }, status: :unprocessable_entity
      return
    end

    user_achievement = UserAchievement.find_by(user_id: user.id, achievement_id: achievement_id)
    unless user_achievement
      user_achievement = UserAchievement.new
      user_achievement.user_id = user.id
      user_achievement.achievement_id = achievement_id
    end
    user_achievement.is_unlocked = true
    user_achievement.save

    achievement = Achievement.find_by_id(achievement_id)

    render json: { status: :ok, achievement:
                   {
                     id: achievement.id,
                     name: achievement.name,
                     description: achievement.description,
                     icon: Refile.attachment_url(achievement, :icon, format: 'png')
                   }
                 }
  end

  def index
    user = User.find_by(authentication_token: [params[:user_token]], email: [params[:user_email]])

    unless user
      render json: { error: 'User does not exists' }, status: :unprocessable_entity
      return
    end

    achievements = []
    user.achievements.each do |achievement|
      achievements.push(id: achievement.id,
                        name: achievement.name,
                        description: achievement.description,
                        icon: Refile.attachment_url(achievement, :icon, format: 'png'))
    end

    render json: { "achievements": achievements }
  end

  private

  def course_params
    params.require(:course).permit(:name, :description)
  end
end
