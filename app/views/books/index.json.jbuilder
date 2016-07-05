json.array!(@books) do |book|
  json.extract! book, :id, :category_id, :title, :author, :publish_id, :photo, :content, :weight, :size, :pages, :date
  json.url book_url(book, format: :json)
end
