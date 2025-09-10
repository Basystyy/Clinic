class AddUniqueIndexToDoctorsPhone < ActiveRecord::Migration[7.1]
  def change
    add_index :doctors, :phone, unique: true
  end
end
