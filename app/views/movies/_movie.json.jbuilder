json.extract! movie, :id, :title, :desc, :year, :time, :created_at, :updated_at
json.url movie_url(movie, format: :json)
