Given /^there are the following users:$/ do |table|
  table.hashes.each do |attributes|
    username = attributes.delete("username")
    @user = User.create!(attributes)
    @user.username = username if username
  end
end

Given /^I am signed in as "(.*?)"$/ do |arg1|
  steps(%Q{
    Given I am on the homepage
    And I fill in "user_email" with "#{@user.email}"
    And I fill in "user_password" with "password"
    Then I should see "Signed in successfully."
  })
end
