ActiveAdmin.register Doctor do
  permit_params :name, :phone, :category_id

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
      f.input :category
    end
    f.actions
  end
end
