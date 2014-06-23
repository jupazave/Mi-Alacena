class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|

    	t.string :name
    	t.string :email

      
    	t.integer :cost


      t.boolean :pagado, default: false
      t.boolean :surtido, default: false
 
      t.text :direccion_envio

      t.timestamps
    end
  end
end
