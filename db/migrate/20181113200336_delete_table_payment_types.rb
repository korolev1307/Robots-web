class DeleteTablePaymentTypes < ActiveRecord::Migration[5.1]
  def change
  	drop_table :payment_types
  end
end
