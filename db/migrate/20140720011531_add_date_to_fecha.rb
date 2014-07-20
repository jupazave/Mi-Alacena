class AddDateToFecha < ActiveRecord::Migration
  def change
    add_column :fechas, :date, :string
  end
end
