class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  attr_accessible :friend_id, :user_id

  validates_uniqueness_of :friend_id, :message => "You are already friends."
  validate :not_myself

  private

  def not_myself
    user_id != friend_id
  end
end
