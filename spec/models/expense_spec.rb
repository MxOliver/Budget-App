require 'rails_helper'

RSpec.describe Expense, type: :model do

    let(:user) { User.create!(username: "oliverc", password: "oxenfree", total_income: 5300 )}
    let(:expense) { Expense.create!(name: "Food", planned_amount: 150, user: user)}

    it { is_expected.to belong_to(:user) }

    it { is_expected.to validate_length_of(:name).is_at_least(2) }

    describe "attributes" do
        it "has a name and planned_amount attribute" do
            expect(expense).to have_attributes(name: "Food", planned_amount: 150, user: user)
        end
    end

end