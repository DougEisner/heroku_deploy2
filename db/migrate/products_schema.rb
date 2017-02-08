class ProductsSchema < ActiveRecord::Migration[5.0]
#This class name - ProductsSchema - must relate to file name - products_schema.

  def up
    create_table :products do |t|
      t.string :name
      t.string :category
      t.numeric :price
    end
  end

  def down
    drop_table :products
  end
end
