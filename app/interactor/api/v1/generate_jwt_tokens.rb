class Api::V1::GenerateJwtTokens
  include Interactor

  def call
    access_exp = Time.current.to_i + 7.days.to_i
    access_payload = { user_id: context.user.id,
                       exp: access_exp }
    context.access_token = JsonWebToken.encode(access_payload)
  end
end
