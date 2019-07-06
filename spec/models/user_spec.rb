require 'rails_helper'

RSpec.describe User, type: :model do

    let(:user) { User.create!(name: "Oliver", total_income: 5200)}

    describe "attributes" do
        it "has name and total_income attributes" do
            expect(user).to have_attributes(name: "Oliver", total_income: 5200)
        end
    end
end