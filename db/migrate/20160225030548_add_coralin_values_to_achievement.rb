class AddCoralinValuesToAchievement < ActiveRecord::Migration
  def change
    add_column :achievements, :name, :string
    add_column :achievements, :description, :text
    add_column :achievements, :icon, :string
  end
end
