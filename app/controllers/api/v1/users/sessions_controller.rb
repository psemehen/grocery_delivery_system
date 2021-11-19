class Api::V1::Users::SessionsController < Api::V1::ApiController
  skip_before_action :authenticate_user, only: :create

  # Access token should be stored on FE side
  def create
    result = Api::V1::Users::Authenticate.call(email: params[:email], password: params[:password])

    if result.success?
      render json: { access_token: result.access_token }, status: :ok
    else
      render_unauthorized(result.message, result.error_code)
    end
  end

  # Access token should be deleted from storage on FE side
  # Refresh flow should also be implemented. In this case on login we have to set refresh jwt token into cookie and delete it from cookie on logout
  def destroy
    head :no_content
  end
end
