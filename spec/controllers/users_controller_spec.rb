require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    let(:new_user_attributes) do
        {
            username: "ollieoxenfree",
            password: "farmcore",
            password_confirmation: "farmcore"
        }
    end

    describe "GET new" do
        it "returns http success" do
            get :new
            expect(response).to have_http_status(:success)
        end

        it "instantiates a new user" do
            get :new
            expect(assigns(:user)).to_not be_nil
        end
    end

    describe "POST create" do
        it "returns an http redirect" do
          post :create, params: { user: new_user_attributes }
          expect(response).to have_http_status(:redirect)
        end

        it "creates a new user" do
          expect{
            post :create, params: { user: new_user_attributes }
          }.to change(User, :count).by(1)
        end
    

        it "sets user username properly" do
          post :create, params: { user: new_user_attributes }
          expect(assigns(:user).username).to eq new_user_attributes[:username]
        end
    
        it "sets user password properly" do
          post :create, params: { user: new_user_attributes }
          expect(assigns(:user).password).to eq new_user_attributes[:password]
        end
    

        it "sets user password_confirmation properly" do
          post :create, params: { user: new_user_attributes }
          expect(assigns(:user).password_confirmation).to eq new_user_attributes[:password_confirmation]
        end

        it "logs the user in after sign up" do
            post :create, params: { user: new_user_attributes }
            expect(session[:user_id]).to eq assigns(:user).id 
        end
        
      end
end
