class AddDeviseToDoctors < ActiveRecord::Migration[7.1]
  def change
    change_table :doctors, bulk: true do |t|
      t.string :encrypted_password, null: false, default: ""
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      # phone уже есть, не добавляем повторно
    end
    add_index :doctors, :reset_password_token, unique: true
  end
end