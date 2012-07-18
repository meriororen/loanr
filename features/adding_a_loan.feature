Feature: Adding a loan data
  In order to create a loan data
  As a loaner
  I want to click a link in my friendlist and do that

  Background:
    Given there are the following users:
      | email                | password | username   |
      | meriororen@gmail.com | password | meriororen |
      | sadonoa@gmail.com    | password | sadonoa    |
      | Fredi@gmail.com      | password | krueger    |
    And "meriororen@gmail.com" is friend with "sadonoa@gmail.com"
    And I am signed in as them

  Scenario: Creating a loan
    When I follow link "Add Loan" for "sadonoa"
    And I fill in "loan_loaner" with "sadonoa"
    And I fill in "loan_amount" with "7000"
    And I press "Create Loan"
    Then I should see "Loan has been created."
