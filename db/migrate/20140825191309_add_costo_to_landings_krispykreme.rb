class AddCostoToLandingsKrispykreme < ActiveRecord::Migration
  def change
  	add_column :landings_krispykremes, :costo, :decimal, :precision => 8, :scale => 2
  end
end
