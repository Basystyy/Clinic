ActiveAdmin.register_page "Doctor Cabinet" do
  menu label: "Doctor Cabinet", if: proc { current_user.is_a?(Doctor) }

  content do
    h2 "Open Appointments"
    open_appointments = current_user.appointments.where(closed: false).order(date: :desc)
    render "shared/appointment_list", locals: { appointments: open_appointments, title: "Open" }

    h2 "Closed Appointments"
    closed_appointments = current_user.appointments.where(closed: true).order(date: :desc)
    render "shared/appointment_list", locals: { appointments: closed_appointments, title: "Closed" }
  end
end