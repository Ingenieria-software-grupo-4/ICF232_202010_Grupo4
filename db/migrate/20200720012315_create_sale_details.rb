class CreateSaleDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_details do |t|
    	t.integer :codigo_venta
    	t.array :productos
    	t.integer :cantidad
      t.timestamps
    end
  end
end

#SaleDetail.create!(codigo_venta: "111", productos: [9999,9999,8888,7777], cantidad: "1")