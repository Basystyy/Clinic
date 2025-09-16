ActiveAdmin.register User do
  permit_params :phone, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :phone
    column :created_at
    column :updated_at
    actions
  end

  filter :id
  filter :phone
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :phone
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
