Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :messages, only: [:index, :create]
    end
  end

  resources :messages, only: [:index] do
    resources :tags
  end

  root to: 'messages#index'
end
