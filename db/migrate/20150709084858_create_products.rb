class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :title, :string
    	t.string :description, :string
    	t.string :price, :decimal, precision: 8, scale: 2
    	t.timestamps
    end
  end
end
