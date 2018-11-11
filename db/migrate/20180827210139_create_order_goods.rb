class CreateOrderGoods < ActiveRecord::Migration[5.1]
  def change
    create_table :order_goods do |t|
      t.references :order, foreign_key: true
      t.references :good, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
