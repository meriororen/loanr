class FriendshipsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_friend, :only => [:create]

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
    if already_friends(current_user, @friend)
      flash[:notice] = "You are already friends."
      redirect_to users_index_path
    else
      if @friendship.save
        flash[:success] = "Friendship request sent."
        redirect_to users_index_path
      else
        flash[:error] = "Friendship request not sent."
        redirect_to users_index_path
      end
    end
  end

  def remove
    sql = "SELECT * FROM friendships WHERE 
          user_id = #{current_user.id} AND friend_id = #{params[:id]} LIMIT 1"
    @friendship = Friendship.find_by_sql(sql).first
    @friendship.destroy
    flash[:success] = "Friend removed"
    redirect_to users_index_path
  end

  private

  def find_friend
    @friend = User.find(params[:friend_id])
  end

  def already_friends(user, friend)
    user.friends.include?(friend) || friend.friends.include?(user)
  end
end
