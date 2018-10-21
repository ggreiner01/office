class Supply < ApplicationRecord
  has_many :inventories
  has_many :suppliers, through: :orders
end
