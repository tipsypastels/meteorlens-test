class AddParallaxToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :parallax, :boolean, default: true
  end
end
