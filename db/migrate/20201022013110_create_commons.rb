class CreateCommons < ActiveRecord::Migration[6.0]
  def change
    create_table :commons do |t|
      t.string :name
      t.text :common

      t.timestamps
    end
  end
end
