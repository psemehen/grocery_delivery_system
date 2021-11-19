class Api::V1::Users::Register
  include Interactor::Organizer

  organize [
    Api::V1::Users::Register::Persist,
    Api::V1::Users::Register::Notify
  ]
end
