Feature: Showing a list of loans by friends
  In order to keep track of my loans to my friends
  As a loaner
  I want to see a list of friends I borrow money from with the loans

  Background:
    Given there are the following users:
      | email                | password | username   |
      | meriororen@loanr.com | password | meriororen |
      | sadonoa@loanr.com    | password | sadonoa    |
    And "meriororen@loanr.com" is friend with "sadonoa@loanr.com"
    And I am signed in as "meriororen@loanr.com"
    And I am on the homepage
    And "meriororen@loanr.com" has the following loans:
      | from              | amount |
      | sadonoa@loanr.com | 7000   |

  Scenario:
    Then I should see the title "sadonoa" within "#lusers h3"
    And I should see the text "7000" within "#lusers ul li"
