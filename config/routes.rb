Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    scope module: :v1, contraints: ApiConstraints.new(version:1, default: :true) do
      get '/', to: "data#index"
      get 'show/:id', to: "data#show"
      post 'create(:format)', to: "data#create"
      delete 'delete/:id', to: "data#destroy"
    end
  end
end
