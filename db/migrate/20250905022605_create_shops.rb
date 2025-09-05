class CreateShops < ActiveRecord::Migration[8.0]
  def change
    create_table :shops do |t|
      t.string :title
      t.string :category
      t.datetime :open_time
      t.datetime :close_time

      t.timestamps
    end
  end
end
