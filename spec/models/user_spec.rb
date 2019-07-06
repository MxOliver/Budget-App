require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(username: "MxOliver", password: "password") }

  it { is_expected.to have_many(:expenses) }
 
   # Shoulda tests for username
   it { is_expected.to validate_presence_of(:username) }
   it { is_expected.to validate_uniqueness_of(:username) }
   it { is_expected.to validate_length_of(:username).is_at_least(3) }
   it { is_expected.to allow_value("MxOliver").for(:username) }
 
   # Shoulda tests for password
   it { is_expected.to validate_presence_of(:password) }
   it { is_expected.to have_secure_password }
   it { is_expected.to validate_length_of(:password).is_at_least(6) }
 
   describe "attributes" do
     it "should have a username attribute" do
       expect(user).to have_attributes(username: "mxoliver")
     end
   end

   describe "invalid user" do
    let(:user_with_invalid_username) { User.new(username: "") }

    it "should be an invalid user due to blank username" do
      expect(user_with_invalid_username).to_not be_valid
    end

  end

end
