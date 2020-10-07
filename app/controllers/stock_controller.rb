class StockController < ApplicationController


get "/stocks" do

  @stocks = Stock.where("user_id=#{session[:user_id]}").map {|stock| stock}
  erb :"stock/index"

end

post "/stocks" do
 
  stock= Stock.find_or_create_by(Stock.create_company(params[:search].upcase))
 
  if stock.price != 0.0 && stock.name !=nil 
    stock.user = User.find(session[:user_id])
    stock.save
    redirect "/stocks"
  else 
    stock.delete
    redirect "/stocks"
  end
end

get "/stocks/:id/edit" do

  redirect_if_not_logged_in

  @stock =Stock.find(params[:id])
  if @stock[:user_id] == current_user.id
    erb :"stock/edit"
  else 
    redirect "/stocks"
  end
end

patch "/stocks/:id" do
  # binding.pry
  @stock =Stock.find(params[:id])
  params.delete("_method")
  @stock.update(params)
  redirect "/stocks"
end

delete "/stocks/:id" do
  @stock =Stock.find(params[:id])
  if @stock[:user_id] == current_user.id
    @stock.destroy
    redirect "/stocks"

  else 
    redirect "/stocks"
  end
end

end