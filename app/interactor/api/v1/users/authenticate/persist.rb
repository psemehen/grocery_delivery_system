class Api::V1::Users::Authenticate::Persist
  include Interactor

  def call
    context.fail!(message: 'Invalid email or password.', error_code: 'invalid_credentials') unless context.user.authenticate(context.password)
  end
end
