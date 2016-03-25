class Achievement < ActiveRecord::Base
  attachment :icon
  belongs_to :user
  belongs_to :course
  has_many :users, through: :user_achievements
end
