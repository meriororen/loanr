class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if @friendship.save
      flash[:success] = "Friendship request sent."
      redirect_to list_of_users_path
    else
      flash[:failed] = "Friendship request not sent."
      redirect_to list_of_users_path
    end
  end
end
