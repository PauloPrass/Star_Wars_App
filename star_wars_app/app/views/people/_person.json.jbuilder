json.extract! person, :id, :name, :mass, :birthyear, :starships_id, :spicies_id, :planets_id, :created_at, :updated_at
json.url person_url(person, format: :json)
