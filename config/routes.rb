Rails.application.routes.draw do
  resources :admins
  get '/change_state/:id/:event' =>  'admins#change_state', as: 'change_state'

  devise_for :users
  
  root to: 'rooms#show'

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
