class JsonWebToken
  class << self
    def encode(payload)
      JWT.encode(payload, Rails.application.credentials.config[:secret_key_base])
    end

    def decode(token)
      body = JWT.decode(token.split(' ').last, Rails.application.credentials.config[:secret_key_base])[0]
      HashWithIndifferentAccess.new body
    rescue StandardError
      nil
    end
  end
end
