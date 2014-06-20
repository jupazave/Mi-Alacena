class CreatePaquetes < ActiveRecord::Migration
  def change
    create_table :paquetes do |t|
    	t.string :name
    	t.text :descrption
    	t.integer :price
    	t.string :image
      	t.timestamps
    end
  end
end
