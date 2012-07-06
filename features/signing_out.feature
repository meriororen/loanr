Feature: Sign out
  In order to securely end my session
  As a user
  I want to click a button and sign out

  Scenario:
    Given there are the following users:
      | email                | password |
      | meriororen@gmail.com | password |
    And I am signed in as them
    Then show me the page
    Then I should see "Signed out successfully."
