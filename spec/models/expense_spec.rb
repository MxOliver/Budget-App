require 'rails_helper'

RSpec.describe Expense, type: :model do

    let(:user) { User.create!(name: "Oliver", total_income: 5200)}
    let(:expense) { Expense.create!(name: "Food", planned_amount: 150, user: user)}

    describe "attributes" do
        it "has a name and planned_amount attribute" do
            expect(expense).to have_attributes(name: "Food", planned_amount: 150)
        end
    end

end