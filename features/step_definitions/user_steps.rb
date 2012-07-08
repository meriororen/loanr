Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
    @user = User.create!(attributes)
  end
end

Given /^I am signed in as "(.*?)"$/ do |user|
  steps(%Q{
    Given I am on the homepage
    And I fill in "user_email" with "#{user}"
    And I fill in "user_password" with "password"
    And I press "Sign In"
    Then I should see "Signed in successfully."
  })
end

Given /^I am signed in as them$/ do
  steps("Given I am signed in as \"#{@user.email}\"")
end

Then /^show me the page$/ do
  save_and_open_page
end
