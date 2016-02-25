class AddCoralinValuesToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :github_clone_link, :string
  end
end
