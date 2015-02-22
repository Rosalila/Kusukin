class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :progress
      t.references :course, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :enrollments, :courses
    add_foreign_key :enrollments, :users
  end
end
