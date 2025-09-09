ActiveAdmin.register User do
  permit_params :phone, :password, :password_confirmation, :role

  index do
    selectable_column
    id_column
    column :phone
    column :role
    actions
  end

  filter :phone
  filter :role

  form do |f|
    f.inputs do
      f.input :phone
      f.input :password
      f.input :password_confirmation
      f.input :role, as: :select, collection: ['patient', 'doctor']
    end
    f.actions
  end

  controller do
    before_action :authenticate_user!
    load_and_authorize_resource
  end
end