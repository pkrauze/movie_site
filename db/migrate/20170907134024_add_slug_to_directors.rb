class AddSlugToDirectors < ActiveRecord::Migration[5.1]
  def change
    add_column :directors, :slug, :string
  end
end
