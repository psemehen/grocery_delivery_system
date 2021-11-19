namespace :api do
  namespace :v1 do
    scope module: 'users' do
      post 'register', to: 'registrations#create'
      post 'login', to: 'sessions#create'
      delete 'logout', to: 'sessions#destroy'
    end

    resources :products, only: :index
  end
end
