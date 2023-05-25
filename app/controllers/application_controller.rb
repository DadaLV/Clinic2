class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.superadmin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to main_app.root_path
    end
  end

  def current_admin_user
    return unless current_user&.superadmin?
    current_user
  end
  
  def after_sign_in_path_for(resource)
    if resource.superadmin
      admin_dashboard_path
    else
      super
    end
  end
end
