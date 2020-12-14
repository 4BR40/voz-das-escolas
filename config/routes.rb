Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :schools, shallow: true do
    resources :reports, shallow: true do
      member do
        put "like", to: "reports#upvote"
        put "dislike", to: "reports#downvote"
      end
      resources :reviews
    end
  end
  # resources :reports, only: %i[index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
