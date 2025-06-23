class AddPopularToAuthors < ActiveRecord::Migration[7.2]
  def change
    add_column :authors, :popular, :boolean
  end
end
