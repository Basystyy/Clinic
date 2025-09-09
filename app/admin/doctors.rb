ActiveAdmin.register Doctor do
  permit_params :phone, :category_id, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :phone
    column :category
    actions
  end

  filter :phone
  filter :category

  form do |f|
    f.inputs do
      f.input :phone
      f.input :category, as: :select,
              collection: Category.all.pluck(:name, :id)
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    before_action :authenticate_user!
    load_and_authorize_resource

    def create
      super do |success|
        resource.errors.add(:category, 'must exist') unless Category.exists?(resource.category_id)
      end
    end
  end
end