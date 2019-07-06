require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do

  let(:my_user) { User.create!(name: RandomData.random_name, total_income: RandomData.random_number)}
  let(:my_expense) { Expense.create!(name: RandomData.random_expense, planned_amount: RandomData.random_number, user: my_user)}

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

  describe "GET #new" do
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

  describe "POST #create" do
    it "increases the expenses count by 1" do
      expect{ post :create, params: { expense: {name: RandomData.random_expense, planned_amount: RandomData.random_number, user: my_user}}}.to change(Expense,:count).by(1)
    end

    it "assigns the new expense to @expense" do
      post :create, params: { expense: {name: RandomData.random_expense, planned_amount: RandomData.random_number, user: my_user }}
      expect(assigns(:expense)).to eq Expense.last
    end
    
  end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
