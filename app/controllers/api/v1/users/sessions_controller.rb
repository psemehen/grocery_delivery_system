class Api::V1::Users::SessionsController < Api::V1::ApiController
  skip_before_action :authenticate_user, only: :create

  def create
    result = Api::V1::Users::Authenticate.call(email: params[:email], password: params[:password])

    if result.success?
      render json: { access_token: result.access_token }, status: :ok
    else
      render_unauthorized(result.message, result.error_code)
    end
  end

  # Access token should be deleted from storage on FE side
  def destroy
    head :no_content
  end
end
