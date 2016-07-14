Feature: Books page

Scenario: Viewing application's books page
  Given there're a book titled "My book" image "Myphoto.jpg" with cost 2 And  sale 1
  When I am on the books
  Then I should see the "My book" image "Myphoto.jpg" with cost 2 and 1 book
