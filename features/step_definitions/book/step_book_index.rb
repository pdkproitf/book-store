Given(/^there're a book titled "([^"]*)" image "([^"]*)" with cost (\d+) And  sale (\d+)$/) do |title, photo, cost, sale|
  @book = FactoryGirl.create(:book, title: title, photo: photo, cost: cost, sale: sale)
end

When(/^I am on the books$/) do
  visit "/books"
end

Then(/^I should see the "([^"]*)" image "([^"]*)" with cost (\d+) and (\d+) book$/)  do |title, photo, cost, sale|
  @book = Book.find_by_title(title)
  expect(page).to have_content(@book.title)
  expect(page.body).to include(@book.photo)
  # expect(page.body).to have_css(".product-f-image")
  expect(page).to have_content((@book.cost - @book.cost * @book.sale).round(2))
  expect(page).to have_content(@book.cost)
end
