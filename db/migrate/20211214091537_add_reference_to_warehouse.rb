class AddReferenceToWarehouse < ActiveRecord::Migration[6.0]
  def change
    add_reference :cars, :warehouse, foreign_key: true
  end
end
