ActiveAdmin.register User do
  permit_params :phone, :role

  index do
    selectable_column
    id_column
    column :phone
    column :role
    actions
  end

  filter :phone
  filter :role, as: :select, collection: ['patient', 'doctor', 'admin']

  form do |f|
    f.inputs do
      f.input :phone
      f.input :role, as: :select, collection: ['patient', 'doctor', 'admin']
    end
    f.actions
  end

  controller do
    def create
      super do |format|
        resource.update(role: params[:user][:role]) if resource.persisted?
      end
    end

    def update
      super do |format|
        resource.update(role: params[:user][:role]) if resource.persisted?
      end
    end
  end
end