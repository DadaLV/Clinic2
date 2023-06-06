ActiveAdmin.register Doctor do
  permit_params :phone, :password, :password_confirmation, :role, :category_id, :superadmin, :full_name

  index do
    selectable_column
    id_column
    column :full_name
    column :phone
    column :role
    column :category
    column :created_at
    actions
  end

  filter :full_name
  filter :phone
  filter :category
  filter :created_at

  form do |f|
    f.inputs "Doctor Details" do
      f.input :full_name
      f.input :phone
      f.input :category_id, as: :select, collection: Category.all
      f.input :password, required: false
      f.input :password_confirmation, required: false
    end
    f.actions
  end
end