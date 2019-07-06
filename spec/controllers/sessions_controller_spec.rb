require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

    let(:my_user) { User.create!( username: "ollieoxenfree", password: "farmcore", password_confirmation: "farmcore")}

    describe "GET new" do
        it "returns http success" do
            get :new
            expect(response).to have_http_status(:success)
        end
    end

    describe "POST sessions" do
        it "returns http success" do
          post :create, params: { session: { username: my_user.username } }
          expect(response).to have_http_status(:success)
        end
    
        it "initializes a session" do
          post :create, params: { session: { username: my_user.username, password: my_user.password } }
          expect(session[:user_id]).to eq my_user.id
        end
    
        it "does not add a user id to session due to missing password" do
          post :create, params: { session: { username: my_user.username } }
          expect(session[:user_id]).to be_nil
        end
    
        it "flashes #error with bad username address" do
          post :create, params: { session: { username: "does not exist" } }
          expect(flash.now[:alert]).to be_present
        end
    
        it "renders #new with bad username address" do
          post :create, params: { session: { username: "does not exist" } }
          expect(response).to render_template :new
        end
    
        it "redirects to the expenses view" do
          post :create, params: { session: { username: my_user.username, password: my_user.password } }
          expect(response).to redirect_to(expenses_path)
        end
      end

      describe "DELETE sessions/id" do
        it "render the #index view" do
          delete :destroy, params: { id: my_user.id }
          expect(response).to redirect_to root_path
        end
    
        it "deletes the user's session" do
          delete :destroy, params: { id: my_user.id }
          expect(assigns(:session)).to be_nil
        end
    
        it "flashes #notice" do
          delete :destroy, params: { id: my_user.id }
          expect(flash[:notice]).to be_present
        end
      end
end
