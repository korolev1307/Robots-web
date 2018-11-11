class AddReferenceFromCategoriesToGoods < ActiveRecord::Migration[5.1]
  def change
  	add_reference :goods, :good_categories, foreign_key: true
  end
end
