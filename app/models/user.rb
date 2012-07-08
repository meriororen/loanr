class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  has_many :loans_as_borrower, :foreign_key => :borrower_id, :class_name => "Loan"
  has_many :loans_as_loaner, :foreign_key => :loaner_id, :class_name => "Loan"

  has_many :friendships
  has_many :friends, :through => :friendships

  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  def is_a_friend_of(friend)
    if (self.friendships.find(:all, :conditions => ['friend_id = ?', friend.id]).empty? ||
       self.inverse_friendships.find(:all, :conditions => ['user_id = ?', friend.id]).empty?)
      false
    else
      true
    end
  end
end
