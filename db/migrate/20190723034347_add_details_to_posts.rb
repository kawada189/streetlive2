class AddDetailsToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :lat, :decimal, :precision => 9, :scale => 6
    add_column :posts, :lon, :decimal, :precision => 9, :scale => 6
  end
end
