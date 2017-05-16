class ChangeUserIdFromBidToInteger < ActiveRecord::Migration[5.0]
  def change
    change_table :bids do |t|
     t.change :user_id, 'integer USING CAST(user_id AS integer)'
   end
  end
end
