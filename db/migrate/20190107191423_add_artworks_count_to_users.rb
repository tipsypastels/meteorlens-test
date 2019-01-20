class AddArtworksCountToUsers < ActiveRecord::Migration[5.2]
  def self.up
    add_column :users, :artworks_count, :integer, null: false, default: 0
  end

  def self.down
    remove_column :users, :artworks_count
  end
end
