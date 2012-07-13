class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  attr_accessible :friend_id, :user_id
  
  validate :not_himself

  private

  def not_himself
    errors.add(:friend_id, "Friendship request not sent.") if friend_id == user_id
  end
end
