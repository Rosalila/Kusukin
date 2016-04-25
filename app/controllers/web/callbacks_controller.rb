class Web::CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    login_origin = params[:login_origin]
    if login_origin
      sign_in_and_redirect login_origin
    else
      sign_in_and_redirect @user
    end
  end
end
