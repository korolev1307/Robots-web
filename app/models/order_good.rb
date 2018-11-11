class OrderGood < ApplicationRecord
  belongs_to :order
  has_many :good
end
