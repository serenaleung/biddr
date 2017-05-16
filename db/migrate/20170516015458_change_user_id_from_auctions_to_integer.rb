class ChangeUserIdFromAuctionsToInteger < ActiveRecord::Migration[5.0]
  def change
    change_table :auctions do |t|
     t.change :user_id, 'integer USING CAST(user_id AS integer)'
   end
  end
end
