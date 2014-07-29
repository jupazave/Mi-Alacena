class AddPaypalToFecha < ActiveRecord::Migration
  def change
    add_column :fechas, :paypal, :string
  end
end
