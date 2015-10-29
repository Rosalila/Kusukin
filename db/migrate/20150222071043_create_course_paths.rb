class CreateCoursePaths < ActiveRecord::Migration
  def change
    create_table :course_paths do |t|
      t.references :course, index: true
      t.references :path, index: true

      t.timestamps null: false
    end
    add_foreign_key :course_paths, :courses
  end
end
