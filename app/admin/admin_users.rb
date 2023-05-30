ActiveAdmin.register User do
  permit_params :phone, :password, :password_confirmation, :role, :superadmin

  index do
    selectable_column
    id_column
    column :phone
    column :role
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :phone
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :phone
      f.input :password
      f.input :password_confirmation
      f.input :superadmin, :label => "Super Administrator"
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
