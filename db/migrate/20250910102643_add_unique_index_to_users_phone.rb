class AddUniqueIndexToUsersPhone < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :phone, unique: true
  end
end
