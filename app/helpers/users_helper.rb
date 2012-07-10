module UsersHelper
  def are_friends(user, friend)
    user.friends.include?(friend) || friend.friends.include?(user)
  end
end
