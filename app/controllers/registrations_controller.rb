class RegistrationsController < Devise::RegistrationsController
 # before_filter :configure_sign_up_params, only: [:create]
 # before_filter :configure_account_update_params, only: [:update]

  before_filter :configure_permitted_parameters, :only => [:create]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
  end
end
