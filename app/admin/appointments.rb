ActiveAdmin.register Appointment do
  permit_params :user_id, :doctor_id, :date, :closed, :recommendation

  index do
    selectable_column
    id_column
    column :user
    column :doctor
    column :date
    column :closed
    column :recommendation
    actions
  end

  filter :id
  filter :user
  filter :doctor
  filter :date
  filter :closed
  filter :created_at

  form do |f|
    f.inputs do
      f.input :user
      f.input :doctor
      f.input :date, as: :datepicker
      f.input :closed
      f.input :recommendation
    end
    f.actions
  end
end
