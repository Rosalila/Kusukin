class Course < ActiveRecord::Base
  dragonfly_accessor :image
  
  has_many :sections
  has_many :enrollments
  has_many :users, through: :enrollments 
  
  belongs_to :user
  belongs_to :category
end
