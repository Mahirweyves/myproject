class AddTelephoneToTrades < ActiveRecord::Migration[6.0]
  def change
    add_column :trades, :telephone, :string
  end
end
