ActiveAdmin.register AdminUser do
  permit_params :phone, :password, :password_confirmation, :role

  index do
    selectable_column
    id_column
    column :phone
    actions
  end

  filter :phone

  form do |f|
    f.inputs do
      f.input :phone
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end