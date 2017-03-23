Rails.application.routes.draw do
  get 'events/show'

  devise_for :users

  resources :registered_applications do
    resources :events
  end
  get 'users/index'

  get 'users/show'

  get 'root/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "root#index"
end
