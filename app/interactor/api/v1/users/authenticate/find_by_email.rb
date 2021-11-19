class Api::V1::Users::Authenticate::FindByEmail
  include Interactor

  def call
    context.user = User.find_by(email: context.email&.downcase&.strip)

    context.fail!(message: 'Invalid email or password.', error_code: 'invalid_credentials') unless context.user
  end
end
