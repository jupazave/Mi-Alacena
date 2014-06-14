class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
    	t.string :name, null: false, default: ""
    	t.string :email, null: false, default: ""
    	t.boolean :pagado, default: false, null: false
    	t.boolean :surtido, default: false, null: false
      	t.timestamps
    end
  end
end
