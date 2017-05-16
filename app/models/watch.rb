class Watch < ApplicationRecord
  belongs_to :user
  belongs_to :auctions

  validates :user_id, uniqueness: {scope: :auction_id}
end
