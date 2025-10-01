class ChangeDoctorIdColumnInAppointments < ActiveRecord::Migration[7.1]
  def change
    change_column_null :appointments, :doctor_id, true
  end
end
