class Api::V1::SessionsController < Devise::SessionsController
  skip_before_filter :verify_authenticity_token

  def create
    Rails.logger.debug { "======" }
    Rails.logger.debug { auth_options }
    Rails.logger.debug { "======" }
    user = warden.authenticate!(params[:session])
    Rails.logger.debug { "======" }
    Rails.logger.debug { user }
    Rails.logger.debug { "======" }
    sign_in(resource_name, user)

    current_user.update authentication_token: nil

    respond_to do |format|
      format.json {
        render :json => {
          user: current_user,
          status: :ok,
          authentication_token: current_user.authentication_token
        }
      }
    end
  end

  def destroy
    respond_to do |format|
      format.json {
        if current_user
          current_user.update authentication_token: nil
          signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
          render :json => {}.to_json, status: :ok
        else
          render :json => {}.to_json, status: :unprocessable_entity
        end
      }
    end
  end
end
