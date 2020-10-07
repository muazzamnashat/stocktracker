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
            redirect "/login"
        end
    end

    get "/logout" do
        redirect_if_not_logged_in
        
        session.clear
        redirect "/login"
    end
end