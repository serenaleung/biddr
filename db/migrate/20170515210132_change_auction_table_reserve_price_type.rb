class ChangeAuctionTableReservePriceType < ActiveRecord::Migration[5.0]
  def change
    change_table :auctions do |t|
     t.change :reserve_price, 'integer USING CAST(reserve_price AS integer)'
   end
  end
end
