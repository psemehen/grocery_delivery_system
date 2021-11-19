class Api::V1::Users::RegistrationsController < Api::V1::ApiController
  skip_before_action :authenticate_user

  def create
    result = Api::V1::Users::Register.call(user_params: user_params)

    if result.success?
      render json: { message: result.message, user_id: result.user.id }, status: :created
    else
      render_validation_errors(result.error_code, result.errors, result.message)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :address)
  end
end
