class AddPhoneToAdminUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :admin_users, :phone, :string
    add_index :admin_users, :phone, unique: true
  end
end
