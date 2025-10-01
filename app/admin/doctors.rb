ActiveAdmin.register Doctor do
  permit_params :name, :phone, :password, :password_confirmation, :category_id

  index do
    selectable_column
    id_column
    column :name
    column :phone
    column :category
    column("Open appoinments") { |doctor| doctor
                                          .appointments.where(closed: false)
                                          .count }
    column("Closed appoinments") { |doctor| doctor
                                            .appointments.where(closed: true)
                                            .count }
    actions
  end

  filter :id
  filter :phone
  filter :category
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :phone
      f.input :password
      f.input :password_confirmation
      f.input :category
    end
    f.actions
  end

  show do
    attributes_table do
      row :phone
      row :category
      row :created_at
      row :updated_at
    end

    panel "Open appoinments" do
      table_for doctor.appointments.where(closed: false) do
        column :id
        column("Patient") { |a| a.user.phone }
        column :date
        column :recommendation
      end
    end

    panel "Closed appoinments" do
      table_for doctor.appointments.where(closed: true) do
        column :id
        column("Patient") { |a| a.user.phone }
        column :date
        column :recommendation
      end
    end
  end
end
