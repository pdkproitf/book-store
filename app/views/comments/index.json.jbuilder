json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_id, :book_id, :desc, :date
  json.url comment_url(comment, format: :json)
end
