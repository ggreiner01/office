class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :suppliesid
      t.integer :empid
      t.integer :suppliersid
      t.integer :amount
      t.float :totalcost
      t.date :date

      t.timestamps
    end
  end
end
