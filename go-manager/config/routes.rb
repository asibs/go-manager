Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'teams#index'

  resources :teams, only: [:index, :show]
  resources :team_leaders, only: [:index, :show]

  resources :appraisal_overalls, only: [:index, :show]
  resources :appraisal_best_stats, only: [:index, :show]

  resources :team_leader_appraisal_overall_phrases, only: [:index, :show]
  resources :team_leader_appraisal_best_stat_phrases, only: [:index, :show]

  resources :species, only: [:index, :show]

  resources :monster_levels, only: [:index, :show]

  resources :trainer_levels, only: [:index, :show]

  # Omniauth routes
  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]
end
