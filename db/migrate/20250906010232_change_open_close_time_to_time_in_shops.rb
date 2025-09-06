class ChangeOpenCloseTimeToTimeInShops < ActiveRecord::Migration[8.0]
  def change
    change_column :shops, :open_time, :time
    change_column :shops, :close_time, :time
  end
end
