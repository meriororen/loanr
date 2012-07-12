Given /^"([^\"]*)" is friend with "([^\"]*)"$/ do |user, friend|
  @user = User.find_by_email!(user)
  @friend = User.find_by_email!(friend)
  Friendship.create!(:user_id => @user.id, :friend_id => @friend.id)
end

Then /^it should indicate "([^\"]*)" for "([^\"]*)"$/ do |indication, username|
  @user = User.find_by_username!(username)
  selector = "#user_#{@user.id} .status"
  page.should have_css(selector, :text => indication)
end
