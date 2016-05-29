json.array!(@shots) do |shot|
  json.extract! shot, :id, :id, :title, :description, :width, :height, :tags, :image_url, :image_path
  json.url shot_url(shot, format: :json)
end
