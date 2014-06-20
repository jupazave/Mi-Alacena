class AddCantidadToPaquetesproductos < ActiveRecord::Migration
  def change
    add_column :paquete_productos, :cantidad, :integer
  end
end
