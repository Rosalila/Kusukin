class ChangeIconName < ActiveRecord::Migration
  def change
    rename_column :achievements, :icon, :icon_id
  end
end
