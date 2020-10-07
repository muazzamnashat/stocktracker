class UserController < ApplicationController

    get "/users/signup" do
        redirect_if_logged_in
        erb :"user/signup"
    end

    post "/users" do
      
            @user = User.new(params)
                if @user && @user.save
                    
                session[:user_id]= @user.id 
                redirect "/stocks"
            else 
                flash[:errors]=@user.errors.full_messages.join(" and ")
                redirect "/users/signup"
            end
        
    end
end