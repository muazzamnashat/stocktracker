class User < ActiveRecord::Base
    has_many :watchlists 
    has_many :stocks, through: :watchlists
end