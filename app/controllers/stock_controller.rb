class StockController < ApplicationController
  get "/stocks" do
    redirect_if_not_logged_in
    @stocks = Stock.where("user_id=#{session[:user_id]}").map { |stock| stock }
    erb :"stock/index"
  end

  post "/stocks" do
    already_in = Stock.where("user_id=#{session[:user_id]}").any? { |stock| stock.ticker == "#{params[:search].upcase}" }

    if already_in
      flash[:message] = "Already on the portfolio!"
      redirect "/stocks"
    end
    stock_info = Stock.create_company(params[:search].upcase)
    stock_info[:user_id] = session[:user_id]
    #could use params[:search].upcase instead of stock_info[:ticker] but then user can create non-valid stock instances
    stock = Stock.create(stock_info)

    if stock.price != 0.0 && stock.name != nil
      redirect "/stocks"
    else
      stock.delete
      redirect "/stocks"
    end
  end

  get "/stocks/:id/edit" do
    redirect_if_not_logged_in

    @stock = Stock.find(params[:id])
    if @stock[:user_id] == current_user.id
      erb :"stock/edit"
    else
      flash[:errors] = "You are not authorized to edit the information!"
      redirect "/stocks"
    end
  end

  patch "/update" do
    params.delete("_method")
    @stock = Stock.find_by(ticker: "#{params.keys.first}")
    updated_price = Stock.create_company("#{params.keys.first}")[:price]
    @stock.update(price: updated_price)
    redirect "/stocks"
  end

  patch "/stocks/:id" do
    @stock = Stock.find(params[:id])
    params.delete("_method")
    @stock.update(params)
    redirect "/stocks"
  end

  delete "/stocks/:id" do
    @stock = Stock.find(params[:id])
    if @stock[:user_id] == current_user.id
      @stock.destroy
      redirect "/stocks"
    else
      redirect "/stocks"
    end
  end

  get "/news" do
    redirect_if_not_logged_in
    erb :"stock/news"
  end

  get "/analysis" do
    redirect_if_not_logged_in
    erb :"stock/analysis"
  end
end
