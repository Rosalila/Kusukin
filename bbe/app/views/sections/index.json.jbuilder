json.array!(@sections) do |section|
  json.extract! section, :id, :number, :videourl, :content, :course_id
  json.url section_url(section, format: :json)
end
