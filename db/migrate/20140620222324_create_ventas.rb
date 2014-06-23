class CreateVentas < ActiveRecord::Migration
  def change
    create_table :ventas do |t|

    	t.integer :pedido_id
    	t.integer :producto_id

    	t.integer :cantidad

      t.timestamps
    end
  end
end
