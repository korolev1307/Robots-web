class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :patronymic, :string, null: false, default: ""
    add_column :users, :surname, :string, null: false, default: ""
    add_column :users, :organisation, :string, default: ""
    add_column :users, :telephone, :string, null: false, default: "" 
  end
end
