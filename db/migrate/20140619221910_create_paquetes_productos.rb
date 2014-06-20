class CreatePaquetesProductos < ActiveRecord::Migration
  def change
    create_table :paquetes_productos do |t|
    	t.integer :paquete_id
    	t.integer :productos_id
      	t.timestamps
    end
  end
end
