class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
    	t.string :nombre
    	t.string :tipo
    	t.integer :codigo
    	t.integer :stock
    	t.integer :precio
    	t.integer :id_usuario
      t.timestamps
    end
  end
end
