class CreateEstados < ActiveRecord::Migration
  def change
    create_table :estados do |t|
		t.string :name, null: false, default: ""
      	t.timestamps
    end
  end
end
