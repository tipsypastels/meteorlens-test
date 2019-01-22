class AddCommentsCountToArtworks < ActiveRecord::Migration[5.2]
  def self.up
    add_column :artworks, :comments_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :artworks, :comments_count
  end
end
