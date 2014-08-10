class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :last_name
      t.string :phone
      t.string :product_link
      t.string :product_name
      t.text :address

      t.timestamps
    end
  end
end
