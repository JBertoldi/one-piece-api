Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :characters, only: %i[index show]

      get 'search/:query', to: 'search#index'
    end
  end
end
