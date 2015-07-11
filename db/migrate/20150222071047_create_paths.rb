class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.string :name
      t.text :description
      t.integer :creator_id

      t.timestamps null: false
    end
  end
end
