class AddColumnFechaEnvioToLandingsKrispyKreme < ActiveRecord::Migration
  def change
  	add_column :landings_krispykremes, :fecha_envio, :datetime
  end
end
