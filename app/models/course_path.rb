class CoursePath < ActiveRecord::Base
  belongs_to :course
  belongs_to :path
end
