json.array!(@exams) do |exam|
  json.extract! exam, :id, :language, :date, :description
  json.url exam_url(exam, format: :json)
end
