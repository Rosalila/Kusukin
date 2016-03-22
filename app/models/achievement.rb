class Achievement < ActiveRecord::Base
  attachment :icon
  belongs_to :user
  belongs_to :course
end
