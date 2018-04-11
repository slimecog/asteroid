Rails.application.routes.draw do
  root "welcome#index"
  get :most_dangerous_day, to: "most_dangerous_day#index"

  namespace :api do
    namespace :v1 do
      get "/user", to: "user#show"
      namespace :user do
        get "/favorites", to "favorites#show"

      namespace :user do
        resources :favorites, only: [:create, :index]
      end
    end
  end
end
