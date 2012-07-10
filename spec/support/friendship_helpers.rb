module FriendshipHelpers 
  def make_friend(user, friend)
    friendship = Friendship.create!(:user_id => user.id, :friend_id => friend.id)
  end
end

RSpec.configure do |config|
  config.include FriendshipHelpers
end
