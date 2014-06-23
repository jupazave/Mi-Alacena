class CreateClickEstados < ActiveRecord::Migration
  def change
    create_table :click_estados do |t|

    	t.string :ip
    	t.integer :estado_id

      t.timestamps
    end
  end
end
