Feature: Category page

Scenario: Viewing application's categories page
Given there's a category name "My first"
When I am on the categories
Then I should see the "My first" categories
