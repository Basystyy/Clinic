class AddArchivedDoctorDataToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :doctor_name, :string
    add_column :appointments, :archived, :boolean, default: false
  end
end