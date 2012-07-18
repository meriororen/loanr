Given /^I am on the homepage$/ do
  visit "/"
end

When /^I follow "(.*?)"$/ do |arg1|
  click_link arg1
end

When /^I fill in "(.*?)" with "(.*?)"$/ do |arg1, arg2|
  fill_in arg1, :with => arg2
end

When /^I press "(.*?)"$/ do |arg1|
  click_button arg1
end

Then /^I should see "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

Then /^I should see the (.*?) "(.*?)" within "([^\"].*)"$/ do |thing, content, selector|
  page.should have_css(selector, :text => content)
end

Given /^"([^\"]*)" has the following loans:$/ do |borrower, table|
  table.hashes.each do |attributes|
    loaner = attributes.delete("from")
    @loan = Loan.new(attributes)
    p @loan
    borrower_id = User.find_by_email!(borrower).id
    loaner_id = User.find_by_email!(loaner).id
    @loan.loaner_id = loaner_id unless loaner_id
    @loan.borrower_id = borrower_id unless borrower_id
    @loan.save
  end
end

When /^I follow the link "([^\"]*)" within "([^\"]*)"$/ do |link, css|
  within :css, css do
    click_link link
  end
end

When /^I follow link "([^\"]*)" for "([^\"]*)"$/ do |link, user|
    user_id = User.find_by_username!(user).id
    steps(%Q{
      When I follow the link "#{link}" within "#user_#{user_id}_add_loan"
    })
end
