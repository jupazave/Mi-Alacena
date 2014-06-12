class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
    	t.string :name, null: false, default: ""
    	t.string :email, null: false, default: ""
    	t.string :idProductos, null: false, default: ""
    	t.string :cantidadesProductos, null: false, default: ""
      	t.timestamps
    end
  end
end
