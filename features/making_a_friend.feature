Feature: Making a friend
  In order to borrow money
  As a user
  I want to add my friend to the friendlist

  Background:
    Given there are the following users:
      | email           | password | username   |
      | user@loanr.com  | password | meriororen |
      | user2@loanr.com | password | abakashi   |
      | user3@loanr.com | password | sinji      |
    And I am signed in as "user@loanr.com"
    Given I am on the homepage
    When I follow "List of users"

  Scenario: Seeing a list of users
    Then I should see the text "abakashi" within "ul#users"
    And I should see the text "sinji" within "ul#users"

  Scenario: Adding a friend
    When I follow the "Add Friend" link for "abakashi"
    Then I should see "Friendship request sent."
    When I follow the "Add Friend" link for "sinji"
    Then I should see "Friendship request sent."
