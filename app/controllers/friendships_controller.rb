class FriendshipsController < ApplicationController
  before_filter :find_friend, :only => [:create]

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if already_friends(current_user, @friend)
      flash[:notice] = "You are already friends."
      redirect_to list_of_users_path
    else
      if @friendship.save
        flash[:success] = "Friendship request sent."
        redirect_to list_of_users_path
      else
        flash[:error] = "Friendship request not sent."
        redirect_to list_of_users_path
      end
    end
  end

  def destroy
    
  end

  private

  def find_friend
    @friend = User.find(params[:friend_id])
  end

  def already_friends(user, friend)
    user.friends.include?(friend) || friend.friends.include?(user)
  end
end
