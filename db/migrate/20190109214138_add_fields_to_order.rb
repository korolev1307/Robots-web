class AddFieldsToOrder < ActiveRecord::Migration[5.1]
  def change
  	add_column :orders, :comment, :text, :default => ""
  	add_column :orders, :telephone, :string, :null => true
  	add_column :orders, :email, :string
  end
end
