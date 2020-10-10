class Stock < ActiveRecord::Base
  belongs_to :user

  def self.create_company(ticker)
    FinnhubRuby.configure do |config|
      config.api_key["token"] = "bttakdf48v6vtisvgdo0"
    end
    finnhub_client = FinnhubRuby::DefaultApi.new

    company = {}
    company[:name] = finnhub_client.company_profile2({ symbol: ticker }).name
    company[:price] = finnhub_client.quote(ticker).c
    company[:ticker] = finnhub_client.company_profile2({ symbol: ticker }).ticker
    company
  end

  def self.news
    FinnhubRuby.configure do |config|
      config.api_key["token"] = "bttakdf48v6vtisvgdo0"
    end
    finnhub_client = FinnhubRuby::DefaultApi.new
    finnhub_client.general_news("general", { min_id: 0 })
  end

  def self.recommend(ticker)
    FinnhubRuby.configure do |config|
      config.api_key["token"] = "bttakdf48v6vtisvgdo0"
    end
    finnhub_client = FinnhubRuby::DefaultApi.new
    trends = finnhub_client.recommendation_trends(ticker)
    recommendation = {}
    trends.each do |t|
      recommendation[:buy] = (recommendation[:buy] || 0) + t.buy
      recommendation[:hold] = (recommendation[:hold] || 0) + t.hold
      recommendation[:sell] = (recommendation[:sell] || 0) + t.sell
      recommendation[:strong_buy] = (recommendation[:strong_buy] || 0) + t.strong_buy
      recommendation[:strong_sell] = (recommendation[:strong_sell] || 0) + t.strong_sell
    end
    recommendation
  end
end
