class FechaVenta < ActiveRecord::Migration[5.2]
  def change
  	add_column :sales, :FechaVenta ,:date
  end
end
