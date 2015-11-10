json.array!(@questions) do |question|
  json.extract! question, :id, :text, :author, :answer_id
  json.url question_url(question, format: :json)
end
