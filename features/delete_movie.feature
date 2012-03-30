Feature: delete a movie

  As a movie buff
  So that I can preserve the quality of the data in the application
  I want to be able to delete movie entries, as in the case of junk entries

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Bogus movie  | PG     | Nada director|   2012-01-01 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |

Scenario: remove an offending film
  When I go to the details page for "Bogus movie"
  And  I press "Delete"
  Then I should be on the home page
  And  I should see "Movie 'Bogus movie' deleted."
  When I check the following ratings: PG, R
  And  I press "Refresh"
  Then I should be on the home page
  And  I should not see "Bogus movie" in the movie list
  But  I should see "Star Wars"
  