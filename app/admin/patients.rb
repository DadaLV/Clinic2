ActiveAdmin.register Patient do
  permit_params :phone, :password, :password_confirmation, :role, :superadmin, :full_name

  index do
    selectable_column
    id_column
    column :full_name
    column :phone
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :full_name
  filter :phone
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Patient Details" do
      f.input :full_name
      f.input :phone
      f.input :password, required: false
      f.input :password_confirmation, required: false
    end
    f.actions
  end
end