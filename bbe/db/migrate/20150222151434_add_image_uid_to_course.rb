class AddImageUidToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :image_uid, :string
  end
end
