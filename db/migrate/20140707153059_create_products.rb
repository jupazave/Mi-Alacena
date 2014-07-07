class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|

			t.string :name

    	t.integer :price

      t.integer :state_id

      t.integer :category_id

      t.text :description

      t.attachment :image

      t.timestamps
    end
  end
end
