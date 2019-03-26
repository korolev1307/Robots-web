class DeleteZipFromOrders < ActiveRecord::Migration[5.1]
  def change
  	remove_column :orders, :zip
  end
end
