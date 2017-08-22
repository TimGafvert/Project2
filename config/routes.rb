Rails.application.routes.draw do
  devise_for :users

  root to: 'users#index'

  resources :skills, only: [:index, :show] do
    member do
      post 'add_proficiency'
      put 'update_proficiency'
      delete 'remove_proficiency'
      put 'update_interest'

      # action not implemented in SkillsController
      # post 'add_interest'

      delete 'remove_interest'
      get 'edit_proficiency'

      # action not implemented in SkillsController
      # get 'edit_interest'

    end
  end
end
