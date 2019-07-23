class RemoveLatLonFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :lat, :string
    remove_column :posts, :lon, :string
  end
end
