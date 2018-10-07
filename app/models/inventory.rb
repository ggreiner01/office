class Inventory < ApplicationRecord
  has_many :supplies
  has_many :orders
end
