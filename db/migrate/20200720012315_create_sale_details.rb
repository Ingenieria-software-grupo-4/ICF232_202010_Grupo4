class CreateSaleDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_details do |t|
    	t.integer :codigo_venta
    	#t.array :id_productos
    	t.integer :cantidad
      t.timestamps
    end
  end
end
