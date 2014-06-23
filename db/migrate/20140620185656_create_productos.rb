class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|

    	t.string :name

    	t.integer :price

      t.integer :estado_id

      t.integer :categoria_id

      t.text :description

      t.attachment :image

      t.timestamps
    end
  end
end
