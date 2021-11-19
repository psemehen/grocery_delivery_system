class Api::V1::Users::Authenticate
  include Interactor::Organizer

  organize [
    Api::V1::Users::Authenticate::FindByEmail,
    Api::V1::Users::Authenticate::Persist,
    Api::V1::GenerateJwtTokens
  ]
end
