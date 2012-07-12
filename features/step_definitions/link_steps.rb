When /^I follow the "([^\"]*)" link within "([^\"]*)"$/ do |link, selector|
  within :css, selector do
    click_link link
  end
end

When /^I follow the "([^\"]*)" link for "([^\"]*)"$/ do |link, username|
  @user = User.find_by_username!(username)
  selector = "#user_#{@user.id}"
  within :css, selector do
    click_link link
  end
end
