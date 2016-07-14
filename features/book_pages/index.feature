Feature: Books page

Scenario: Viewing application's books page
  Given there're a book titled "My book" photo "Myphoto.jpg" with cost 2 sale 1 category "my category" publish "my publish" author "my authour" content "my content" weight 500 size "50x50" pages 55 date "2016-07-14 21:58:10 +0700"
  When I am on the books
  Then I should see the "My book" image "Myphoto.jpg" with cost 2 and 1 book

Scenario: View'ing details of a book
  Given there're a book titled "My book" photo "Myphoto.jpg" with cost 2 sale 1 category "my category" publish "my publish" author "my authour" content "my content" weight 500 size "50x50" pages 55 date "2016-07-14 21:58:10 +0700"
  When I am on the book details
  Then I should see book titled "My book" image "Myphoto.jpg" with cost 2 sale 1 category "my category" publish "my publish" author "my authour" content "my content" weight 500 size "50x50" date "2016-07-14 21:58:10 +0700"
