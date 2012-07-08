When /^I follow the "([^\"]*)" link within "([^\"]*)"$/ do |link, selector|
  within :css, selector do
    click_link link
  end
end

When /^I follow the "([^\"]*)" link for "([^\"]*)"$/ do |link, user|
  selector = "#user_#{user}"
  within :css, selector do
    click_link link
  end
end
