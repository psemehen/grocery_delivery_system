class Api::V1::Users::Authorize
  include Interactor

  def call
    decoded_auth_token = JsonWebToken.decode(context&.access_token)

    if decoded_auth_token
      context.user = User.find_by(id: decoded_auth_token[:user_id])
    else
      context.fail!(message: 'Please log in to proceed.', error_code: 'unauthorized')
    end
  end
end
