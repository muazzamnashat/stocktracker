class SessionController < ApplicationController

    get "/login" do
        redirect_if_logged_in
        erb :"user/login"
    end

    post "/login" do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id

            redirect "/stocks"
        else
            flash[:notice] = "You've entered an invalid email or password. Please try again."
            redirect "/login"
        end
    end

    get "/logout" do
        redirect_if_not_logged_in
        
        session.clear
        flash[:message] = "Successfully logged out!"

        redirect "/login"
    end
end