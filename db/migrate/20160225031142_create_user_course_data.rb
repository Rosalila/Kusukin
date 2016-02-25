class CreateUserCourseData < ActiveRecord::Migration
  def change
    create_table :user_course_data do |t|
      t.integer :course_id
      t.integer :user_id
      t.text :json_data

      t.timestamps null: false
    end
  end
end
