class AddAvailableDateToTrades < ActiveRecord::Migration[6.0]
  def change
    add_column :trades, :available_date, :datetime
  end
end
