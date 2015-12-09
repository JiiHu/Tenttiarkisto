json.array!(@exams) do |exam|
  json.extract! exam, :id, :language, :date, :description, :author
  json.url exam_url(exam, format: :json)
end
