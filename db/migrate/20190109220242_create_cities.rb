class CreateCities < ActiveRecord::Migration[5.1]
  def change
    create_table :cities do |t|
      t.string :delivery_city
      t.integer :max_weight_ss
      t.integer :max_weight_sd
      t.integer :min_price_ss
      t.integer :min_price_sd
      t.integer :kg_price_ss
      t.integer :kg_price_sd
      t.string :delivery_time_ss
      t.string :delivery_time_sd

      t.timestamps
    end
  end
end
