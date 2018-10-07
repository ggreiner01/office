class CreateSupplies < ActiveRecord::Migration[5.1]
  def change
    create_table :supplies do |t|
      t.string :supplyname
      t.string :supplydescription


      t.timestamps
    end
  end
end
