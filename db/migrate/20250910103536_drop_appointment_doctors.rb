class DropAppointmentDoctors < ActiveRecord::Migration[7.1]
  def change
    drop_table :appointment_doctors
  end
end
