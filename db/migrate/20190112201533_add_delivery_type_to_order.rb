class AddDeliveryTypeToOrder < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :delivery_type, :integer
  end
end
