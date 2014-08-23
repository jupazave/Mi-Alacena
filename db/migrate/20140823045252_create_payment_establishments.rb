class CreatePaymentEstablishments < ActiveRecord::Migration
  def change
    create_table :payment_establishments do |t|

    	t.string :name
    	t.string :key

      t.timestamps
    end
  end
end
