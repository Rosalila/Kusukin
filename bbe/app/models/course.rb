class Course < ActiveRecord::Base
  belongs_to :category
  dragonfly_accessor :image
end
