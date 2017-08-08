Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: 'toppages#index'

get 'signup' => 'users#new'
get 'user' => 'users#show'

resources :tasks
end
