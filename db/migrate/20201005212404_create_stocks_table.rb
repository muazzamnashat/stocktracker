class CreateStocksTable < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.string :name
      t.float :price
      t.string :ticker
      t.text :note
      t.integer :user_id
      t.timestamps
    end
  end
end
