Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :reports, only: [:new, :create]
  resources :schools, shallow: true do
    resources :reports, shallow: true do
      resources :reviews
    end
  end

  #
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
