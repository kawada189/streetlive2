class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :start_time
      t.text :contents
      t.string :genre
      t.string :image
      t.string :place
      t.string :lat
      t.string :lon

      t.timestamps
    end
  end
end
