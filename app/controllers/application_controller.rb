require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions, true
    set :session_secret, "thisisthequickanddirtyway"
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def current_user
      # binding.pry
      @user ||= User.find(session[:user_id])
    end

    def logged_in?
      !!session[:user_id]
    end

    def redirect_if_not_logged_in
      if !logged_in?
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
