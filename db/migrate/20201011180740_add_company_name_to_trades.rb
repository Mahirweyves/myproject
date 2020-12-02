class AddCompanyNameToTrades < ActiveRecord::Migration[6.0]
  def change
    add_column :trades, :company_name, :string
  end
end
