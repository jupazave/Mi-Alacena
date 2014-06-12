class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
    	t.string :name, null: false, default: ""
    	t.string :image, null: false, default: ""
    	t.string :price, null: false, default: ""
    	t.integer :estado_id
      	t.timestamps
    end
  end
end
