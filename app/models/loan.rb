class Loan < ActiveRecord::Base
  attr_accessible :amount, :from

  validates_presence_of :amount, :from
end
