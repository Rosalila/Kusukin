class Web::CallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.from_omniauth(request.env["omniauth.auth"])
    params = request.env["omniauth.params"]
    login_origin = params["login_origin"]
    if login_origin
      redirect_to login_origin
    else
      sign_in_and_redirect @user
    end
  end
end
