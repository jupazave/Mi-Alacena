class AddCityToFecha < ActiveRecord::Migration
  def change
    add_column :fechas, :city, :string
  end
end
