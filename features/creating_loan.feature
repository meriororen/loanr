Feature: Creating loans
  In order to keep track of my loans
  As a user
  I want to create a loan data
  
  Background:
    Given I am on the homepage
    When I follow "New Loan"

  Scenario: Creating a loan
    And I fill in "From" with "Isa Ansharullah"
    And I fill in "Amount" with "50000"
    And I press "Create Loan"
    Then I should see "Loan has been created."

  Scenario: Creating a loan with insufficient info
    And I press "Create Loan"
    Then I should see "Loan has not been created."
