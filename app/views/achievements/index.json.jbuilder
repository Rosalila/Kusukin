json.array!(@achievements) do |achievement|
  json.extract! achievement, :id, :title, :user_id, :course_id
  json.url achievement_url(achievement, format: :json)
end
