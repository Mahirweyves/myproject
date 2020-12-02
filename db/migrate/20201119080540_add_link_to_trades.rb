class AddLinkToTrades < ActiveRecord::Migration[6.0]
  def change
    add_column :trades, :link, :text
  end
end
