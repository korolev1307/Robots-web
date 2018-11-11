class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :sum
      t.string :adress
      t.datetime :date_of_deliveru
      t.references :payment_type, foreign_key: true
      t.boolean :paid_status
      t.boolean :delivery_status

      t.timestamps
    end
  end
end
