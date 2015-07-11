class AddFieldsToSection < ActiveRecord::Migration
  def change
    add_column :sections, :title, :string
    add_column :sections, :homework_description, :string
    add_column :sections, :price, :decimal
  end
end
