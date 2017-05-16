class AddUserIdToColumnToAuction < ActiveRecord::Migration[5.0]
  def change
    add_column :auctions, :user_id, :string
  end
end
