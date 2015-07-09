class CreateProduct < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :description
      t.decimal :price, precision: 6, scale: 2

      t.timestamps
      
    end
  end
end
