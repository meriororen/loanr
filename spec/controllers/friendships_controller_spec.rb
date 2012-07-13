require 'spec_helper'

describe FriendshipsController do
  let(:user){ FactoryGirl.create(:user) }
  let(:friend) { FactoryGirl.create(:user) }

  context "User" do 
    before do
      sign_in :user, user
    end

    it "cannot add another user who already a friend" do
      make_friend user, friend
      post :create, :friend_id => friend.id
      response.should redirect_to(users_index_path)
      flash[:notice].should eql("You are already friends.")
    end

    it "cannot add himself as a friend" do
      post :create, :friend_id => user.id
      response.should redirect_to(users_index_path)
      flash[:error].should eql("Friendship request not sent.")
    end
  end
end
