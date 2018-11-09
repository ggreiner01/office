class PagesController < ApplicationController
  def inventory
    @suppliers = Supplier.all
    @supplies = Supply.all
    @order_item = current_order.order_items.new
    @orders = Order.all
    @costs = Cost.all
    @inventories = Inventory.all
    @supplyQuantity = Supply.joins(:inventories)
           .select('inventories.supply_id,supplies.supplyname,inventories.quantity, supplies.suppliesid')
    @orderInfo = Order.joins(:suppliers).where('orders.suppliersid = suppliers.id').select('orders.*, suppliers.name')

    @osInfo = Order.joins("INNER JOIN suppliers ON suppliers.id = orders.supplier_id INNER JOIN supplies ON supplies.suppliesid = orders.suppliesid INNER JOIN users ON orders.empid = users.id").select('users.first_name, users.last_name, orders.*', 'suppliers.name', 'supplies.*')

    @oInfo = Supplier.joins("INNER JOIN costs ON costs.supplier_id = suppliers.id INNER JOIN supplies ON supplies.suppliesid = costs.supply_id").select("supplies.supplyname, suppliers.name, costs.*")
    @oz = OrderItem.joins("INNER JOIN costs ON costs.supply_id = order_items.supply_id").select('costs.cost AS price, order_items.supply_id').where('costs.supply_id = 5');
  end

  def emps
    @users = User.all
  end
end
