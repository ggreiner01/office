class PagesController < ApplicationController
  def inventory
    @suppliers = Supplier.all
    @supplies = Supply.all
    @orders = Order.all
    @inventories = Inventory.all
    @zz = Supply.joins(:inventories)
           .select('inventories.supply_id,supplies.supplyname,inventories.quantity')
    @orderInfo = Order.joins(:suppliers).where('orders.suppliersid = suppliers.id').select('orders.*, suppliers.name')

    @osInfo = Order.joins("INNER JOIN suppliers ON suppliers.id = orders.supplier_id INNER JOIN supplies ON supplies.suppliesid = orders.suppliesid INNER JOIN users ON orders.empid = users.id").select('users.*, orders.*', 'suppliers.name', 'supplies.*')

    @oInfo = Supplier.joins(:orders)

  end

  def emps
    @users = User.all
  end
end
