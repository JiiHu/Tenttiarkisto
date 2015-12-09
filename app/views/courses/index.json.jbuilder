json.array!(@courses) do |course|
  json.extract! course, :id, :name, :identifier, :subject_id, :keywords
  json.url course_url(course, format: :json)
end
