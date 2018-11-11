class CreateGoods < ActiveRecord::Migration[5.1]
  def change
    create_table :goods do |t|
      t.string :name
      t.integer :quantity
      t.integer :price
      t.text :description

      t.timestamps
    end
  end
end
