class Order < ApplicationRecord
  attribute :senderCityId, :integer, default: 44
  belongs_to :user
  has_many :order_goods
  before_save :update_total
  before_save :update_status

  def calculate_total
    self.order_goods.collect { |product| product.quantity * Good.find(product.good_id).price }.sum
  end

  def delete_nonactual_orders
    @orders = Order.all
    @orders.each do |order|
      if User.find(order.user_id).nil? || User.find(order.user_id).guest?
        order.delete
      end
    end
  end
  
  private

  def update_status
    if self.status.nil?
      self.status = "В процессе"
    end
  end

  def update_total
    self.total_price = calculate_total
  end

end
