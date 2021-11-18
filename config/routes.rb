Rails.application.routes.draw do
  constraints format: :json do
    draw :api
  end
end
