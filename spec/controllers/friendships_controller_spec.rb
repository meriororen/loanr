require 'spec_helper'

describe FriendshipsController do
  let(:user){ FactoryGirl.create(:user) }
  let(:friend) { FactoryGirl.create(:user) }

  context "User" do 
    before do
      sign_in :user, user
      make_friend user, friend
    end

    it "cannot add another user who already a friend" do
      post :create, :friend_id => friend.id
      response.should redirect_to(list_of_users_path)
      flash[:notice].should eql("You are already friends.")
    end
  end
end
