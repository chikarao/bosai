class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end


  def after_update_path_for(resource)
    user_requests_path(current_user.id) ##session[:previous_url] ||
  end
end
