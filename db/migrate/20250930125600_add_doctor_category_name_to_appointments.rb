class AddDoctorCategoryNameToAppointments < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :doctor_category_name, :string
  end
end
