class SessionsController < ApplicationController
    def create
        @user = User.find_by(username: params[:username])

        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            message = "Something went wrong. Check username / password."
            redirect_to root_path, notice: message
        end
    end

    def destroy
        session.delete(:user_id)
        @user = nil
        redirect_to root_path
    end
end
