class Loan < ActiveRecord::Base
  attr_accessible :amount, :from

  validates_presence_of :amount, :from
  validates_numericality_of :amount, :message => "Please input a number", :with => /^\d+\.?\d{0,2}$/
end
