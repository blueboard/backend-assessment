Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'rewards#index'

  resource :session, only: [:new, :create, :destroy]
  resource :setting, only: [:edit, :update]
  resources :rewards, only: [:index]

  scope '/api/v1', defaults: { format: 'json' } do
    resource :session, only: [:create, :destroy]
    resource :setting, only: [:show, :update]
    resources :rewards, only: [:index]
  end
end
