Feature: Remove a friend
  In order to keep track of my loan record
  As a loaner
  I want to remove a user that I'm finished business with

  Background: Removing a friend from a friend list
    Given there are the following users:
      | email           | password | username   |
      | user@loanr.com  | password | meriororen |
      | user2@loanr.com | password | abakashi   |
      | user3@loanr.com | password | sinji      |
    And "user@loanr.com" is friend with "user2@loanr.com"
    And I am signed in as "user@loanr.com"
    Given I am on the homepage
    When I follow "List of users"

  Scenario: Users that are friends can be removed
    When I follow the "Remove Friend" link for "abakashi"
    Then it should indicate "[ Not yet friend ]" for "abakashi"


