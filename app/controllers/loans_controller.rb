class LoansController < ApplicationController
  def index
  end

  def new
    @loan = Loan.new
  end

  def create
    @loan = Loan.new(params[:loan])
    if @loan.save
      flash[:notice] = "Loan has been created."
      redirect_to loans_path
    else
      flash[:notice] = "Loan has not been created."
      render :action => "new"
    end
  end
end
