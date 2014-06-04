json.array!(@todos) do |todo|
  json.extract! todo, :id, :user_id, :content
  json.url todo_url(todo, format: :json)
end
