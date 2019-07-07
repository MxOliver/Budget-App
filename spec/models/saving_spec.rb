require 'rails_helper'

RSpec.describe Saving, type: :model do
  let(:user) { User.create!(username: "oliverc", password: "oxenfree", total_income: 5300 )}
  let(:expense) { Expense.create!(name: "Food", planned_amount: 150, user: user)}
  let(:saving) { Saving.create!(long_term: true, short_term: false, expense: expense)}

  describe "attributes" do
    it "has a long term and short term attribute" do
      expect(saving).to have_attributes(long_term: true, short_term: false)
    end
  end

end
