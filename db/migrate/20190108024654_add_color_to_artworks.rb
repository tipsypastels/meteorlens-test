class AddColorToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :color, :string
  end
end
