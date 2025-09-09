ActiveAdmin.register User do
  permit_params :phone, :password, :password_confirmation

  index do
    selectable_column
    id_column
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

  controller do
    before_action :authenticate_user!
    load_and_authorize_resource
  end
end