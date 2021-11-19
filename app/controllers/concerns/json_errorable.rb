module JsonErrorable
  extend ActiveSupport::Concern

  JSON_STANDARD_ERRORS = [
    ActiveRecord::UnknownAttributeError, NoMethodError, TypeError, NameError, SyntaxError,
    ArgumentError, RuntimeError, StandardError
  ].freeze

  included do
    rescue_from(*JSON_STANDARD_ERRORS, with: :render_standard_error)
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_error
  end

  # status: 500
  def render_standard_error(error)
    # notify in some error handling tool like sentry/honeybadger/airbrake
    render_error('An error occurred. Please try again later.', { status: 500, e: error })
  end

  def render_not_found_error(error)
    # notify in some error handling tool like sentry/honeybadger/airbrake
    render_error('An error occurred. Please try again later.', { status: 404, e: error })
  end

  # used for validation form
  #
  # status: 400
  def render_validation_errors(error_code, errors, message = 'Please correct the form')
    render_error(message, { status: :bad_request, error_code: error_code, errors: errors })
  end

  # used for domain-specific failures bad or normal (non-form)
  #
  # status: 400
  def render_invalid_request_error(message, error_code)
    render_error(message, { status: :bad_request, error_code: error_code })
  end

  # unable to be processed
  #
  # status: 422
  def render_unprocessable_entity(message)
    render_error(message, { status: :unprocessable_entity })
  end

  # used for access control errors
  #
  # status: 401
  def render_unauthorized(message, error_code)
    render_error(message, { status: :unauthorized, error_code: error_code })
  end

  private

  def render_error(message, options = {})
    options = { status: :bad_request }.merge(options)

    render_json(message, options)
  end

  def render_json(message, options)
    returned_hash = {}
    returned_hash[:message] = message
    returned_hash[:error_code] = options[:error_code] if options[:error_code]
    returned_hash[:errors] = options[:errors] if options[:errors]

    render json: returned_hash, status: options[:status]
  end
end
