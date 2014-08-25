class CreateLandingsKrispykremes < ActiveRecord::Migration
  def change
    create_table :landings_krispykremes, {:id => false} do |t|

    	t.string :id, null: false
    	t.string :name
    	t.string :email
    	t.string :tel
    	t.integer :glaseadas
    	t.integer :surtidas
    	t.text :sabores
    	t.boolean :pagado, null: false, default: false

      t.timestamps
    end
  end
end
