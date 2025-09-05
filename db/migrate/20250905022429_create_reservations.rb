class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.integer :number_of_persons

      t.timestamps
    end
  end
end
