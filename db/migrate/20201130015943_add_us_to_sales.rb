class AddUsToSales < ActiveRecord::Migration[5.2]
  def change
    add_column :sales, :us, :integer
  end
end
