require 'rails_helper'

include SessionsHelper

RSpec.describe ExpensesController, type: :controller do

  let(:my_user) { User.create!(username: RandomData.random_name, password: "password1234", total_income: RandomData.random_number)}
  let(:my_expense) { Expense.create!(name: RandomData.random_expense, planned_amount: RandomData.random_number, user: my_user)}

  context "guest user" do

    describe "GET #index" do
      it "returns http redirect" do
        get :index
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "GET #show" do
      it "returns http redirect" do
        get :show, params: { id: my_expense.id }
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "GET new" do
      it "returns http redirect" do
        get :new
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "GET edit" do
      it "returns http redirect" do
        get :edit, params: { id: my_expense.id }
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "POST create" do
      it "returns http redirect" do
        post :create, params: { expense: {name: RandomData.random_expense, planned_amount: RandomData.random_number, user: my_user}}
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "PUT update" do
      it "returns http redirect" do
        new_name = RandomData.random_word
        new_planned_amount = RandomData.random_number
        new_actual_amount = RandomData.random_number

        put :update, params: { id: my_expense.id, expense: { name: new_name, planned_amount: new_planned_amount, actual_amount: new_actual_amount }}
        expect(response).to redirect_to(new_session_path)
      end
    end

    describe "DELETE destroy" do
      it "returns http redirect" do
        delete :destroy, params: { id: my_expense.id }
        expect(response).to redirect_to(new_session_path)
      end
    end


  end

  context "signed-in user" do
    before do
      create_session(my_user)
    end


    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end

      it "assigns [my_expense] to @expenses" do
        get :index
        expect(assigns(:expenses)).to eq([my_expense])
      end

      
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, params: { id: my_expense.id }
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show, params: { id: my_expense.id }
        expect(response).to render_template :show
      end

      it "assigns my_expense to @expense" do
        get :show, params: { id: my_expense.id }
        expect(assigns(:expense)).to eq(my_expense)
      end

    end

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new
        expect(response).to render_template :new
      end

      it "instantiates @expense" do
        get :new
        expect(assigns(:expense)).not_to be_nil
      end

    end

    describe "POST create" do
      it "increases the expenses count by 1" do
        expect{ post :create, params: { expense: {name: RandomData.random_expense, planned_amount: RandomData.random_number, user: my_user, long_term_savings: true }}}.to change(Expense,:count).by(1)
      end

      it "assigns the new expense to @expense" do
        post :create, params: { expense: {name: RandomData.random_expense, planned_amount: RandomData.random_number, user: my_user, long_term_savings: true }}
        expect(assigns(:expense)).to eq Expense.last
      end

      it "redirects to the index view" do
        post :create, params: { expense: {name: RandomData.random_expense, planned_amount: RandomData.random_number, user: my_user, long_term_savings: true }}
        expect(response).to redirect_to expenses_path
      end
      
    end

    describe "GET edit" do
      it "returns http success" do
        get :edit, params: { id: my_expense.id }
        expect(response).to have_http_status(:success)
      end

      it "renders the #edit view" do
        get :edit, params: { id: my_expense.id }
        expect(response).to render_template :edit
      end

      it "assigns expense to be updated to @expense" do
        get :edit, params: { id: my_expense.id }
        expense_instance = assigns(:expense)

        expect(expense_instance.id).to eq my_expense.id
        expect(expense_instance.name).to eq my_expense.name
        expect(expense_instance.planned_amount).to eq my_expense.planned_amount
      end
    end

    describe "PUT update" do
      it "updates expense with expected attributes" do
        new_name = RandomData.random_word
        new_planned_amount = RandomData.random_number
        new_actual_amount = RandomData.random_number
        new_long_term_savings = false
        new_short_term_savings = true

        put :update, params: { id: my_expense.id, expense: { name: new_name, planned_amount: new_planned_amount, actual_amount: new_actual_amount, long_term_savings: new_long_term_savings, short_term_savings: new_short_term_savings }}

        updated_expense = assigns(:expense)
        expect(updated_expense.id).to eq my_expense.id
        expect(updated_expense.name).to eq new_name
        expect(updated_expense.planned_amount).to eq new_planned_amount
        expect(updated_expense.actual_amount).to eq new_actual_amount
        expect(updated_expense.long_term_savings).to eq new_long_term_savings
        expect(updated_expense.short_term_savings).to eq new_short_term_savings
      end

      it "redirects to the index" do
        new_name = RandomData.random_word
        new_planned_amount = RandomData.random_number
        new_actual_amount = RandomData.random_number

        put :update, params: { id: my_expense.id, expense: { name: new_name, planned_amount: new_planned_amount, actual_amount: new_actual_amount }}

        expect(response).to redirect_to expenses_path
      end
    end

    describe "DELETE destroy" do
      it "deletes the expense" do
        delete :destroy, params: { id: my_expense.id }

        count = Expense.where({id: my_expense.id}).size
        expect(count).to eq 0
      end

      it "redirects to expenses index" do
        delete :destroy, params: { id: my_expense.id }
        expect(response).to redirect_to expenses_path
      end
    end

  end #signed in user context

end
