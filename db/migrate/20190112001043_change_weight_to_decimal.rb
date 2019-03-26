class ChangeWeightToDecimal < ActiveRecord::Migration[5.1]
  def change
  	change_column :goods, :weight, :decimal, default: 0
  end
end
