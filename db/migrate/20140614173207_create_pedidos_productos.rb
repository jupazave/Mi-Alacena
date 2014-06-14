class CreatePedidosProductos < ActiveRecord::Migration
  def change
    create_table :pedidos_productos do |t|
      t.integer :pedidos_id
      t.integer :productos_id
      t.integer :cantidad

      t.timestamps
    end
  end
end
