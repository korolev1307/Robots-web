class AddReferenceCityOrder < ActiveRecord::Migration[5.1]
  def change
  	add_reference :orders, :cities, foreign_key: true
  end
end
