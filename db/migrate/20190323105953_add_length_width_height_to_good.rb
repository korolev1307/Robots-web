class AddLengthWidthHeightToGood < ActiveRecord::Migration[5.1]
  def change
  	add_column :goods, :length, :decimal, default: 0
  	add_column :goods, :width, :decimal, default: 0
  	add_column :goods, :height, :decimal, default: 0
  end
end
