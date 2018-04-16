Rails.application.routes.draw do
  root "welcome#index"
  get :most_dangerous_day, to: "most_dangerous_day#index"

  namespace :api do
    namespace :v1 do
      get "/user", to: "user#show"

      namespace :user do
        get :favorites, to: 'favorites#index'
        post :favorites, to: 'favorites#create'
      end
    end
  end
end
