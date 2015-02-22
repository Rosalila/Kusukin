class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :link
      t.decimal :price
      t.references :section, index: true

      t.timestamps null: false
    end
    add_foreign_key :homeworks, :sections
  end
end
