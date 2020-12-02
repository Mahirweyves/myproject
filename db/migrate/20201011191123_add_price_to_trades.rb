class AddPriceToTrades < ActiveRecord::Migration[6.0]
  def change
    add_column :trades, :price, :string
  end
end
