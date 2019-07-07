require 'rails_helper'

RSpec.describe SavingsController, type: :controller do

    let(:my_user) { User.create!(username: RandomData.random_name, password: "password1234", total_income: RandomData.random_number)}

    let(:my_expense) { Expense.create!(name: RandomData.random_expense, planned_amount: RandomData.random_number, user: my_user)}
    let(:my_saving) { Saving.create!(long_term: true, shot_term: false) }

    describe "GET show" do
        it "return http success" do
            get :show, params: { expense_id: my_expense.id, id: my_saving.id }
            expect(response).to have_http_status(:success)
        end

        it "renders the #show view" do
            get :show, params: { expense_id: my_expense.id, id: my_saving.id }
            expect(response).to render_template :show
        end

        it "assigns my_saving to @saving" do
            get :show, params: { expense_id: my_expense.id, id: my_saving.id }
            expect(assigns(:saving)).to eq(my_saving)
        end
    end

end
