Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :teams, only: [:index, :show]
  resources :team_leaders, only: [:index, :show]

  resources :appraisal_overalls, only: [:index, :show]
  resources :appraisal_best_stats, only: [:index, :show]

  resources :team_leader_appraisal_overall_phrases, only: [:index, :show]
  resources :team_leader_appraisal_best_stat_phrases, only: [:index, :show]

  resources :species, only: [:index, :show]

  resources :monster_levels, only: [:index, :show]

  resources :trainer_levels, only: [:index, :show]
end
