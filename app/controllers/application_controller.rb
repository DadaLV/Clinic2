class ApplicationController < ActionController::Base
  include Draper::ViewHelpers
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "You are not authorized to access this page."
  end
  
  def authenticate_active_admin_user!
    authenticate_user!
    unless current_user.superadmin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to new_user_session_path
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

  def not_found_method
    render file: Rails.public_path.join('404.html'), status: :not_found, layout: false
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name, :role])
  end

end
