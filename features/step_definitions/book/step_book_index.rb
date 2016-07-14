Given(/^there're a book titled "([^"]*)" photo "([^"]*)" with cost (\d+) sale (\d+) category "([^"]*)" publish "([^"]*)" author "([^"]*)" content "([^"]*)" weight (\d+) size "([^"]*)" pages (\d+) date "([^"]*)"$/) do |title, photo, cost, sale, category, publish, author, content, weight, size, pages, date|
@category = FactoryGirl.create(:category, name: category)
@publish = FactoryGirl.create(:publish, name: publish)
@book = FactoryGirl.create(:book, title: title, photo: photo, cost: cost, sale: sale, category_id: @category.id, publish_id: @publish.id, author: author, content: content, weight: weight,size: size, pages: pages, date: DateTime.parse(date).to_date)
end

When(/^I am on the books$/) do
  visit books_path
end

Then(/^I should see the "([^"]*)" image "([^"]*)" with cost (\d+) and (\d+) book$/)  do |title, photo, cost, sale|
  @book = Book.find_by_title(title)
  expect(page).to have_content(@book.title)
  expect(page.body).to include(@book.photo)
  # expect(page.body).to have_css(".product-f-image")
  expect(page).to have_content((@book.cost - @book.cost * @book.sale).round(2))
  expect(page).to have_content(@book.cost)
end
# **************************************************************************
When(/^I am on the book details$/) do
  visit book_path(@book)
end

Then(/^I should see book titled "([^"]*)" image "([^"]*)" with cost (\d+) sale (\d+) category "([^"]*)" publish "([^"]*)" author "([^"]*)" content "([^"]*)" weight (\d+) size "([^"]*)" date "([^"]*)"$/) do |title, photo, cost, sale, category, publish, author, content, weight, size, date|
  expect(page).to have_content(@book.title)
  expect(page.body).to include(@book.photo)
  expect(page).to have_content((@book.cost - @book.cost * @book.sale).round(2))
  expect(page).to have_content(@book.cost)
  expect(page).to have_content(@category.name)
  expect(page).to have_content(@publish.name)
  expect(page).to have_content(@book.author)
  expect(page).to have_content(@book.content)
  expect(page).to have_content(@book.weight)
  expect(page).to have_content(@book.size)
  expect(page).to have_content(@book.date)
end
