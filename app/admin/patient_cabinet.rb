ActiveAdmin.register_page "Patient Cabinet" do
  menu label: "Patient Cabinet", if: proc { current_user.is_a?(User) }

  content do
    h2 "My Appointments"
    appointments = current_user.appointments.order(date: :desc)
    render "shared/appointment_list",
            locals: { appointments: appointments,
            title: "All Appointments" }
  end
end