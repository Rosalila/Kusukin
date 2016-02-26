class RenameUserCourseDataToUserCourseStorage < ActiveRecord::Migration
  def change
    rename_table :user_course_data, :user_course_storages
  end
end
