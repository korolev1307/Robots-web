class AddWeightToGood < ActiveRecord::Migration[5.1]
  def change
  	add_column :goods, :weight, :integer
  end
end
