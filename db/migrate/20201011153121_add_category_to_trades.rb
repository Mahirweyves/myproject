class AddCategoryToTrades < ActiveRecord::Migration[6.0]
  def change
    add_column :trades, :category_id, :integer
  end
end
