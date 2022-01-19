Rails.application.routes.draw do
  root to: 'todos#index'

  resources :todos, only: %i[index new create]

  resource :session, only: %i[new create]
end
