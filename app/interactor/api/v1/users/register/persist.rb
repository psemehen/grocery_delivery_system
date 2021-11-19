class Api::V1::Users::Register::Persist
  include Interactor

  def call
    user = User.new(context.user_params)

    if user.save
      context.user = user
      context.message = 'Thanks so much for your registration! Please login to continue.'
    else
      context.fail!(message: 'Sorry, your registration attempt was unsuccessful. Please try again.', error_code: 'user_registration_error', errors: user.errors.messages)
    end
  end
end
