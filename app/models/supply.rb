class Supply < ApplicationRecord
  has_many :inventories
  has_many :suppliers, through: :orders
  has_many :order_items
end
