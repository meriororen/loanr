class LoansController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new]

  def index
    @loans = Loan.find_all_by_borrower_id(current_user.id)
  end

  def new
    @loan = Loan.new(:loaner_id => params[:loaner])
  end

  def create
    loaner_name = params[:loan].delete(:loaner)
    @loaner = User.find_by_username(loaner_name)
    @loan = Loan.new(params[:loan].merge!(
      :loaner_id => @loaner.id,
      :borrower_id => current_user.id))
    if @loan.save
      flash[:success] = "Loan has been created."
      redirect_to loans_path
    else
      flash[:error] = "Loan has not been created."
      render :action => "new"
    end
  end
end
