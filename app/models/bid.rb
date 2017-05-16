class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :user

  validates :price, presence: true, numericality: {greater_than: :auction_current}
  validate :check_price
  after_save :update_auction

  def check_price
    if self.price <= self.auction.current_price
       errors.add(:price, "Bid price must be larger than the current bid price.")
    end
  end

  def update_auction
    self.auction.update_attribute(:current_price, self.price)
    if self.price >= self.auction.reserve_price
      self.auction.meet_reserve
    end
  end

  def auction_current
    auction.current_price
  end
end
