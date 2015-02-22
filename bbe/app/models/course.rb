class Course < ActiveRecord::Base
  belongs_to :category
  dragonfly_accessor :image
  has_many :sections
end
