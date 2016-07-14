module BooksHelper
  def price book
    (book.cost - book.cost * book.sale).round(2)
  end
end
