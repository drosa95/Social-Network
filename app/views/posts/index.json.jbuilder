json.array!(@posts) do |post|
  json.extract! post, :id, :image_url, :text, :place, :date
  json.url post_url(post, format: :json)
end
