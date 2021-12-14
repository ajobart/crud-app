class FixColor < ActiveRecord::Migration[6.0]
  def change
    remove_column :cars, :color
    add_column :cars, :color, :string
  end
end
