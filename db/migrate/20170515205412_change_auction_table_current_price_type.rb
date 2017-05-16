class ChangeAuctionTableCurrentPriceType < ActiveRecord::Migration[5.0]
  def change
    change_table :auctions do |t|
     t.change :current_price, 'integer USING CAST(current_price AS integer)'
   end
  end
end
