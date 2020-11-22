class CreateSales < ActiveRecord::Migration[5.2]
  def change
    create_table :sales do |t|
    	t.integer :us
    	t.integer :monto
    	t.integer :codigo
      t.timestamps
    end
  end
end
