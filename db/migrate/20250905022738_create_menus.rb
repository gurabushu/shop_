class CreateMenus < ActiveRecord::Migration[8.0]
  def change
    create_table :menus do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
