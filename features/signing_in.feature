Feature: Sign in
  In order to see my own loan data
  As a user
  I want to be able to login into the site

  Background: 
    Given there are the following users:
      | email                | password | username   |
      | meriororen@gmail.com | password | meriororen |
      | meriororen@ymail.com | password | merioromen |
    And I am on the homepage

  Scenario: Signing in to the app
    When I fill in "user_email" with "meriororen@gmail.com"
    And I fill in "user_password" with "password"
    And I press "Sign In"
    Then I should see "Signed in successfully"
