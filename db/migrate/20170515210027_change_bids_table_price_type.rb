class ChangeBidsTablePriceType < ActiveRecord::Migration[5.0]
  def change
    change_table :bids do |t|
     t.change :price, 'integer USING CAST(price AS integer)'
   end
  end
end
