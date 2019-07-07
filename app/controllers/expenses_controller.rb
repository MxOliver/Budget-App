class ExpensesController < ApplicationController

  before_action :require_sign_in

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

    @expense = Expense.new(expense_params)
    @expense.user = current_user

    if @expense.save

      flash[:notice] = "New expense catagory saved"
      redirect_to expenses_path
    else
      flash.now[:alert] = "There was a problem saving a new expense, please try again."
      render :new
    end

  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.assign_attributes(expense_params)

    if @expense.save
      flash[:notice] = "Expense was updated successfully!"
      redirect_to expenses_path
    else
      flash.now[:alert] = "There was an error updating, please try again."
      render :edit
    end
  end

  def destroy
    @expense = Expense.find(params[:id])

    if @expense.destroy
      flash[:notice] = "\"#{@expense.name}\" was deleted successfully."
      redirect_to expenses_path
    else
      flash.now[:alert] = "There was an error deleting the expense."
      render :index
    end
  end

  private
  def expense_params
    params.require(:expense).permit(:name, :planned_amount, :actual_amount, :short_term_savings, :long_term_savings)
  end

end
