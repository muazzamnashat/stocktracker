require "./config/environment"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :sessions, true
    set :session_secret, "thisisthequickanddirtyway"
    register Sinatra::Flash
  end

  get "/" do
    @stocks = Stock.all.map { |i| i }
    erb :welcome
  end

  helpers do
    def current_user
      @user ||= User.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "You need to be logged in to see the page!"
        redirect "/login"
      end
    end

    def redirect_if_logged_in
      if logged_in?
        redirect "/stocks"
      end
    end
  end
end
