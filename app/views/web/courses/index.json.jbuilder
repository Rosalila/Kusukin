json.array!(@courses) do |course|
  json.extract! course, :id, :name, :description, :category_id
  json.url course_url(course, format: :json)
end
