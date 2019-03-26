class DeleteFieldFromOrders < ActiveRecord::Migration[5.1]
  def change
  	remove_column :orders, :adress
  	remove_column :orders, :date_of_deliveru
  	remove_column :orders, :paid_status
  	remove_column :orders, :payment_type_id
  	remove_column :orders, :delivery_status
    rename_column :orders, :sum, :total_price
    add_column :orders, :status, :string
  end
end
