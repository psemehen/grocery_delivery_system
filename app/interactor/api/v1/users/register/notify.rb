class Api::V1::Users::Register::Notify
  include Interactor

  def call
    # This should run in background, for example via Sidekiq
    UserMailer.welcome(context.user).deliver_now
  end
end
