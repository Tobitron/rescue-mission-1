Rails.application.routes.draw do
  resources :questions, only: [:show,:index,:new]
  root 'questions#index'
end
