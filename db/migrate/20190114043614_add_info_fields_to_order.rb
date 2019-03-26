class AddInfoFieldsToOrder < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :zip, :integer
  	add_column :orders, :FIO, :string
  	add_column :orders, :address, :string
  end
end
