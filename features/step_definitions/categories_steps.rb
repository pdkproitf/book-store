Given(/^there's a category name "(.*?)"$/) do |name|
  @category = FactoryGirl.create(:category, name: name)
end

When(/^I am on the categories$/) do
  visit "/categories"
end

Then(/^I should see the "(.*?)" categories$/) do |name|
  @category = Category.find_by_name(name)
  expect(page).to have_content(@category.name)
end
# ******************************************************************************
Given /^I am in category_path "(.+)"$/ do |page_path|
  visit page_path
end

When /^I fill in "(.+)" with "(.+)"$/ do |name_field, name|
  fill_in(name_field, with: name)
end

When /^I press category "(.+)"$/ do |button|
  click_button(button)
end

Then /^I should see category "(.+)"$/ do |text|
  page.has_content? text
end
# ******************************************************************************
