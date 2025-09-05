# db/migrate/xxxxxxxxxxxx_add_devise_columns_to_users.rb
class AddDeviseColumnsToUsers < ActiveRecord::Migration[8.0]
  def change
    change_table :users, bulk: true do |t|
      ## Database authenticatable
      t.string :email,              default: ""   # 最初は null 許容（後で厳格化）
      t.string :encrypted_password, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      # Trackable / Confirmable / Lockable は必要になったら後で
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email
    end

    # 既に index がある環境だと二重追加になるので存在チェックを挟む
    add_index :users, :email, unique: true, where: "email IS NOT NULL" unless index_exists?(:users, :email)
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
  end
end