class Loan < ActiveRecord::Base
  attr_accessible :amount, :borrower_id, :loaner_id

  validates_presence_of :amount
  validates_numericality_of :amount, :message => "Please input a number", :with => /^\d+\.?\d{0,2}$/

  belongs_to :borrower, :foreign_key => :borrower_id, :class_name => "User"
  belongs_to :loaner, :foreign_key => :loaner_id, :class_name => "User"

  validate :loaner_is_not_borrower

  private

  def loaner_is_not_borrower
      errors.add(:from, "You cannot be in debt with yourself") if borrower_id == loaner_id
  end
end
