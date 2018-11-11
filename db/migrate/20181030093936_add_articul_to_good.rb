class AddArticulToGood < ActiveRecord::Migration[5.1]
  def change
  	add_column :goods, :articul, :string
  end
end
