class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create

    @expense = Expense.new
    @expense.name = params[:expense][:name]
    @expense.planned_amount = params[:expense][:planned_amount]

    if @expense.save

      flash[:notice] = "New expense catagory saved"
      redirect_to :index
    else
      flash.now[:alert] = "There was a problem saving a new expense, please try again."
      render :new
    end

  end

  def edit
  end
end
