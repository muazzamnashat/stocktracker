class User < ActiveRecord::Base
  has_many :stocks

  has_secure_password

  validates :username, :email, presence: true
  validates :email, uniqueness: true

  def sorted
    self.stocks.sort_by { |s| s.price }
  end
end
