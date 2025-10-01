class ChangeClosedColumnInAppointments < ActiveRecord::Migration[7.1]
  def change
    change_column :appointments,
                  :closed, :boolean,
                  null: false,
                  default: false
  end
end
