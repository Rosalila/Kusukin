class Achievement < ActiveRecord::Base
  belongs_to :user
  belongs_to :course
  has_many :users, through: :user_achievements
end
