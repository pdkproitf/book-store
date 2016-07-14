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
