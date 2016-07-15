Feature: Category page

Scenario: Viewing application's categories page
  Given there's a category name "My first"
  When I am on the categories
  Then I should see the "My first" categories

Scenario: Create a category with valid
  Given I am in category_path "/categories/new"
  When I fill in "category[name]" with "my category"
  When I press "Create Category"
  Then I should see "Category was successfully created."

Scenario: Create a category with invalid presence
  Given I am in category_path "/categories/new"
  When I fill in "category[name]" with "my category"
  When I press category "Create Category"
  Then I should see category "Name has already been taken."

Scenario: Create a category with invalid blank
  Given I am in category_path "/categories/new"
  When I fill in "category[name]" with "my category"
  When I press category "Create Category"
  Then I should see category "Name can't be blank"
