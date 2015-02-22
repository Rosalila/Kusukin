class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :number
      t.string :videourl
      t.text :content
      t.references :course, index: true

      t.timestamps null: false
    end
    add_foreign_key :sections, :courses
  end
end
