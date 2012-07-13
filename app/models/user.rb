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

  validates_presence_of :username, :email

  def friendlist
    list = []
    list << self.friends
    list << self.inverse_friends
    list.flatten
  end

  def friendship_list
    flist = []
    flist << self.friendships
    flist << self.inverse_friendships
    flist.flatten
  end

  def is_a_friend_of(friend)
    self.friendlist.include?(friend)
  end
end
