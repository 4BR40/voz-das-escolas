Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'reviews/update'
  get 'reviews/edit'
  get 'reviews/destroy'
  get 'reviews/index'
  get 'reviews/show'
  get 'reports/new'
  get 'reports/create'
  get 'reports/update'
  get 'reports/edit'
  get 'reports/destroy'
  get 'reports/index'
  get 'reports/show'
  devise_for :users
  root to: 'pages#home'
  resources :schools do
    resources :reports do
      resources :reviews
    end
  end
  # resources :reports, only: %i[index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
