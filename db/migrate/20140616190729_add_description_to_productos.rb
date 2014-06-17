class AddDescriptionToProductos < ActiveRecord::Migration
  def change
    add_column :productos, :description, :text
  end
end
