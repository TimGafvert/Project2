Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :skills, only: [:index, :show] do
    member do
      post 'add_proficiency'
      put 'update_proficiency'
      delete 'remove_proficiency'
      put 'update_interest'
      post 'add_interest'
      delete 'remove_interest'
    end
  end
end
