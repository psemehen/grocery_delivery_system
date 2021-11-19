class Api::V1::ApiController < ActionController::API
  include ActionController::Cookies
  include JsonErrorable

  before_action :authenticate_user

  def current_user
    @result = Api::V1::Users::Authorize.call(access_token: request.headers['Authorization'])
    @current_user ||= @result.user if @result.success?
  end

  def authenticate_user
    render_unauthorized(@result.message, @result.error_code) unless current_user
  end
end
