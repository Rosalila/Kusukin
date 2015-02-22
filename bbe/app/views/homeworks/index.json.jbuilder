json.array!(@homeworks) do |homework|
  json.extract! homework, :id, :link, :price, :section_id
  json.url homework_url(homework, format: :json)
end
