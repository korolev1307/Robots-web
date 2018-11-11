class AddShortDecriptionFieldToGoods < ActiveRecord::Migration[5.1]
  def change
  	add_column :goods, :short_description, :text, :null => true
  end
end
