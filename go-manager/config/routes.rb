Rails.application.routes.draw do
  
  # Go Manager routes for special actions
  get 'go_manager/:trainer_id' => 'go_managers#show'
  post 'go_manager/:trainer_id' => 'go_managers#create'

  # User modifiable resources - all options enabled
  resources :trainers do
    resources :monsters do
      resources :monster_appraisals
      resources :monster_evolutions
      resources :monster_levels

      # Programmatically set, rather than set explicitly by the user, only allow GETs
      resources :monster_possible_ivs, only: [:index, :show]
      resources :monster_summaries, only: [:index, :show]
    end
  end
  
  # Static resources - GET only
  resources :species, only: [:index, :show]
  resources :species_base_stats, only: [:index, :show]

  resources :levels_data, only: [:index, :show]

  resources :teams, only: [:index, :show]
  resources :team_leaders, only: [:index, :show]
  resources :appraisal_individual_phrases, only: [:index, :show]
  resources :appraisal_overall_phrases, only: [:index, :show]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
