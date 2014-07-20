class CreateFechas < ActiveRecord::Migration
  def change
    create_table :fechas do |t|
      t.string :title
      t.string :price
      t.string :link

      t.timestamps
    end
  end
end
