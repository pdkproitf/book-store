# **************************index************************************************
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
# **************************show************************************************
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
# ****************************new**********************************************
Given(/^I am on book path "([^"]*)" with category_id (\d+) publish_id (\d+)$/) do |page_path, category, publish|
  @category = FactoryGirl.create(:category, id: category)
  @publish = FactoryGirl.create(:publish, id: publish)
  visit page_path
end

When(/^I fill in title "([^"]*)" with "([^"]*)", photo "([^"]*)" with "([^"]*)", cost "([^"]*)" with (\d+), sale "([^"]*)" with (\d+), category_id "([^"]*)" with (\d+), publish_id "([^"]*)" with (\d+), author "([^"]*)" with "([^"]*)", content "([^"]*)" with "([^"]*)", weight "([^"]*)" with (\d+), size "([^"]*)" with "([^"]*)", pages "([^"]*)" with (\d+) and date "([^"]*)" is "([^"]*)"$/) do  |title_feild, title, photo_feild, photo, cost_feild, cost, sale_feild, sale, category_id_feild, category, publish_id_feild, publish, author_feild, author, content_feild, content, weight_feild, weight, size_feild, size, pages_feild, pages, date_feild, date|
  fill_in(title_feild, with: title)
  fill_in(photo_feild, with: photo)
  fill_in(cost_feild, with: cost)
  fill_in(sale_feild, with: sale)
  fill_in(category_id_feild, with: category)
  fill_in(publish_id_feild, with: publish)
  fill_in(author_feild, with: author)
  fill_in(content_feild, with: content)
  fill_in(weight_feild, with: weight)
  fill_in(size_feild, with: size)
  fill_in(pages_feild, with: pages)
  fill_in(date_feild, with: DateTime.parse(date).to_date)
end

When /^I press "(.+)"$/ do |button|
  click_button(button)
end

Then /^I should see "([^\"]*)"$/ do |text|
  page.has_content? text
end
# *******************************update********************************************
Given(/^I am on edit book path with category_id (\d+) publish_id (\d+)$/) do |category, publish|
  @category = FactoryGirl.create(:category, id: category)
  @publish = FactoryGirl.create(:publish, id: publish)
  @book = FactoryGirl.create(:book)
  visit edit_book_path(@book)
end

When(/^I press update_book_button "([^"]*)"$/) do |button|
  click_button(button)
end

Then(/^I should see content "([^"]*)"$/) do |text|
  page.has_content? text
end
# **************************destroy************************************************
When(/^I visit destroy_book_link$/) do
  visit book_path(@book)
end

Then(/^I should see destroy_book_content "([^"]*)"$/) do |text|
  page.has_content? text
end
