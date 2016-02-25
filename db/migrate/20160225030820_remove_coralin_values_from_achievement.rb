class RemoveCoralinValuesFromAchievement < ActiveRecord::Migration
  def change
    remove_column :achievements, :title, :string
    remove_column :achievements, :user_id, :integer
  end
end
