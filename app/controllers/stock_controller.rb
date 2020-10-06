class StockController < ApplicationController
##fetch price, company name data with a parameter of stock symbol
##

get "/stocks" do
  if logged_in?
    @stocks= Stock.find_by(user_id: session[:user_id])
  erb :"stock/index"
  else  
    redirect "/login"
  end
end

post "/home" do
  # binding.pry
  if Stock.new(Stock.create_company(params[:search])).price != 0.0
 @stock= Stock.find_or_create_by(Stock.create_company(params[:search]))
 erb :"stock/index"
  else 
    flash[:errors]= "Not found"
    redirect "/home"
  end
end

get "/edit" do
  erb :"stock/edit"
end
end