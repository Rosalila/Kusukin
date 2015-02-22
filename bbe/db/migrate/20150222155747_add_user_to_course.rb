class AddUserToCourse < ActiveRecord::Migration
  def change
    add_reference :courses, :user, index: true
    add_foreign_key :courses, :users
  end
end
