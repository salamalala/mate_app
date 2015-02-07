json.array!(@ratings) do |rating|
  json.extract! rating, :id, :rating, :review
  json.url rating_url(rating, format: :json)
end
