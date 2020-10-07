class User < ActiveRecord::Base
    has_many :watchlists 
    has_many :stocks, through: :watchlists

    has_secure_password

    validates :username, :email, presence: true
    validates :email, uniqueness: true
    
end