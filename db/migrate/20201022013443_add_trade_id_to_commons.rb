class AddTradeIdToCommons < ActiveRecord::Migration[6.0]
  def change
  	add_column :commons, :trade_id, :integer
  end
end
