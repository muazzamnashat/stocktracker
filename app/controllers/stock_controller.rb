class StockController < ApplicationController
##fetch price, company name data with a parameter of stock symbol
##

get "/stocks" do
  list= Watchlist.where("user_id=#{session[:user_id]}").map do |watch|
      watch.stock_id
  end
  @stocks = list.map do |i| 
    Stock.where("id=#{i}")
  end.flatten
  # binding.pry
  erb :"stock/index"
end

post "/stocks" do
  
  
 stock= Stock.find_or_create_by(Stock.create_company(params[:search].upcase))
 
 if stock.price != 0.0 && stock.name !=nil 

 w= Watchlist.find_or_create_by(stock_id:stock.id)
 w.user= User.find(session[:user_id])
  w.save

redirect "/stocks"
  else 
    stock.delete
    redirect "/stocks"
  end
end

get "/edit" do
  erb :"stock/edit"
end
end