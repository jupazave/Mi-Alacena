class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
    	t.boolean :service
    	t.string :product
    	t.decimal :price, :precision => 8, :scale => 2
    	t.decimal :fee, :precision => 8, :scale => 2
    	t.string :name
    	t.string :email
    	
      t.timestamps
    end
  end
end
