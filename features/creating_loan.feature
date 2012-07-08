Feature: Creating loans
  In order to keep track of my loans
  As a user
  I want to create a loan data
  
  Background:
    Given there are the following users:
      | email                | password |
      | meriororen@gmail.com | password |
      | sadonoa@gmail.com    | password |
    And "sadono@gmail.com" and "meriororen@gmail.com" are friends
    And I am signed in as "meriororen@gmail.com"

  Scenario: Borrowing money
    When I follow "Borrow Money"
    And I fill in "Amount" with "4000"
    And I press "Create Loan"
    Then I should see "Loan has been created."
