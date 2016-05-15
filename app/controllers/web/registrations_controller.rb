class Web::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, only: [:create]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
  end
end
