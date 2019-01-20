class AddSlugToArtwork < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :slug, :string
  end
end
