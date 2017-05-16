class ChangeAuctionsTableEndDateType < ActiveRecord::Migration[5.0]
  def change
    change_table :auctions do |t|
     t.change :end_date, 'date USING CAST(end_date AS date)'
    end
  end
end
