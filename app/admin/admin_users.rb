ActiveAdmin.register User do
  permit_params :phone, :password, :password_confirmation, :role, :superadmin, :full_name

  index do
    selectable_column
    id_column
    column :full_name
    column :phone
    column :role
    column :created_at
    actions
  end

  filter :full_name
  filter :phone
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :full_name
      f.input :phone
      f.input :password, required: false
      f.input :password_confirmation, required: false
      f.input :superadmin, label: "Super Administrator"
      f.input :role, as: :select, collection: User.roles.keys, include_blank: false
    end
    f.actions
  end

  controller do
    def build_new_resource
      super.tap do |user|
        user.role = params.dig(:user, :role) if params.dig(:user, :role).present?
      end
    end

    def update
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end

    def create
      if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end

end
