class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(username: params[:session][:username].downcase)

        if user && user.authenticate(params[:session][:password])
            create_session(user)
            flash[:notice] = "Welcome, #{user.username}!"
            redirect_to root_path
        else
            flash.now[:alert] = "Invalid username/password combination"
            render :new
        end
    end

    def destroy
        destroy_session(current_user)
        flash[:notice] = "You've been signed out successfully"
        redirect_to root_path
    end
end
