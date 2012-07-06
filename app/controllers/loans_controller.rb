class LoansController < ApplicationController
  def index
    @loans = Loan.all
  end

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(params[:loan])
    if @loan.save
      flash[:success] = "Loan has been created."
      redirect_to loans_path
    else
      flash[:error] = "Loan has not been created."
      render :action => "new"
    end
  end
end
