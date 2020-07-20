class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
	create_table :usuarios do |t|
		t.string :nombre
		t.integer :rut
		t.string :email
		t.integer :telefono 
	  t.timestamps
	end
  end
end
