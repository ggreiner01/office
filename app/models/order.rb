class Order < ApplicationRecord
  has_many :supplies
  has_many :suppliers
  has_many :employees
end
