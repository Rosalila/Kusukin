class Api::V1::SessionsController < Devise::SessionsController
  skip_before_filter :verify_signed_out_user, :only => [:destroy]

  def create
    user = warden.authenticate!(params[:session])
    sign_in(resource_name, user)

    current_user.authentication_token = nil
    current_user.save

    respond_to do |format|
      format.json {
        render json: {
          user: current_user,
          status: :ok,
          authentication_token: current_user.authentication_token
        }
      }
    end
  end

  def destroy
    respond_to do |format|
      user = User.find_by authentication_token: params[:authentication_token]
      format.json {
        if user
          user.authentication_token = nil
          user.save
          sign_out(user)
          render nothing: true, status: :ok
        else
          render json: nil, status: :unprocessable_entity
        end
      }
    end
  end
end
