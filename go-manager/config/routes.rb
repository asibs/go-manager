Rails.application.routes.draw do

  resources :monster_summaries
  resources :monster_possible_ivs
  resources :levels_data
  resources :monster_levels
  resources :monster_evolutions
  resources :monster_appraisals
  # Static resources - GET only
  resources :teams, only: [:index, :show]

  resources :species_base_stats
  resources :species
  resources :trainers
  resources :appraisal_individual_phrases
  resources :appraisal_overall_phrases
  resources :team_leaders
  resources :monsters
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
