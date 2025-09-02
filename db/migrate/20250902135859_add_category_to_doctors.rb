class AddCategoryToDoctors < ActiveRecord::Migration[7.1]
  def change
    add_column :doctors, :category_id, :integer
  end
end
