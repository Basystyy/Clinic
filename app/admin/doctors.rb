ActiveAdmin.register Doctor do
  permit_params :name, :phone, :category_id, :password, :password_confirmation, :avatar

  index do
    selectable_column
    id_column
    column :name
    column :phone
    column :category
    actions
  end

  filter :name
  filter :phone
  filter :category

  form do |f|
    f.inputs do
      f.input :name
      f.input :phone
      f.input :category, as: :select, collection: Category.all.pluck(:name, :id)
      f.input :password
      f.input :password_confirmation
      f.input :avatar, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :phone
      row :category
    end

    panel "Open Appointments" do
      table_for doctor.appointments.where(closed: false) do
        column :user do |a| a.user&.name end
        column :date
        column :actions do |a|
          link_to "Comment", edit_admin_appointment_path(a)
        end
      end
    end

    panel "Closed Appointments" do
      table_for doctor.appointments.where(closed: true) do
        column :user do |a| a.user&.name end
        column :date
        column :recommendation
      end
    end
  end

  controller do
    def destroy
      doctor = Doctor.find(params[:id])
      doctor.appointments.where(closed: false).destroy_all
      super
    end
  end
end
