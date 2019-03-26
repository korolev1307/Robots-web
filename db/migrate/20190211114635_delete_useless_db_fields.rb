class DeleteUselessDbFields < ActiveRecord::Migration[5.1]
  def change
  	remove_column :orders, :cities_id
  	drop_table :cities
  	add_column :orders, :senderCityId, :integer
  	add_column :orders, :receiverCityId, :integer
  	add_column :orders, :tariffId, :integer
  	add_column :orders, :modeId, :integer
  end
end
