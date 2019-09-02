Rails.application.routes.draw do
  resources :tournaments, only: [:index, :show] do
    resources :teams, only: [:index, :show]
    resources :fixtures, only: [:index, :show]
    resources :weeks, only: [:show]
  end
end