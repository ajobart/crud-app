class CreateWarehouses < ActiveRecord::Migration[6.0]
  def change
    create_table :warehouses do |t|
      t.string :address
      t.string :capacity

      t.timestamps
    end
  end
end
