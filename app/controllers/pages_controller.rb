class PagesController < ApplicationController
  def order_page
    @suppliers = Supplier.all
    @supplies = Supply.all
    @inventories = Inventory.all
    @zz = Supply.joins(:inventories)
           .select('inventories.supply_id,supplies.supplyname,inventories.quantity')
  end

  def emps
    @users = User.all
  end
end
