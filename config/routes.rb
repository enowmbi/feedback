Rails.application.routes.draw do
  devise_for :users
  root "questions#index"
  resources :answers
  resources :comments
  resources :tags
  resources :questions
end
