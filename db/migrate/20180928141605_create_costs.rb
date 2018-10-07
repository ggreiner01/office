class CreateCosts < ActiveRecord::Migration[5.1]
  def change
    create_table :costs do |t|
      t.integer :supplierid
      t.integer :suppliesid
      t.float :cost

      t.timestamps
    end
  end
end
