class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :address, :organization_id, :phone_number, :email])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :address, :organization_id, :phone_number, :email])
  end

  # Sou July27
  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  private

  # override the devise helper to store the current location so we can
  # redirect to it after loggin in or out. This override makes signing in
  # and signing up work automatically.


  def store_current_location
    store_location_for(:user, request.url)
  end

  def after_sign_out_path_for(_resource)
    request.referrer || root_path
  end

  after_filter :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if request.path != '/users/sign_in' &&
       request.path != '/users/sign_up' &&
       request.path != '/users/password/new' &&
       request.path != '/users/password/edit' &&
       request.path != '/users/confirmation' &&
       request.path != '/users/sign_out' &&
       !request.xhr? # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    user_requests_path(current_user.id) ##session[:previous_url] ||
  end

end
