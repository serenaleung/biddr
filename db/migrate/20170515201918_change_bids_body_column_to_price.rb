class ChangeBidsBodyColumnToPrice < ActiveRecord::Migration[5.0]
  def change
    rename_column :bids, :body, :price
  end
end
