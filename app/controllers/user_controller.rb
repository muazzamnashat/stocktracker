class UserController < ApplicationController

    get "/users/signup" do
        erb :"user/signup"
    end

    post "/users" do
        # binding.pry
        if params[:username]=="" || params[:username]=="" || params[:username]==""
            redirect "/users/signup"
        else
            @user = User.new(params)
                if @user && @user.save
                    
                session[:user_id]= @user.id 
                redirect "/stocks"
            else 
                redirect "/users/signup"
            end
        end
    end
end