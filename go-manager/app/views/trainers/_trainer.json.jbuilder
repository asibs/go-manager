json.extract! trainer, :id, :name, :current_level, :team_id, :created_at, :updated_at
json.url trainer_url(trainer, format: :json)