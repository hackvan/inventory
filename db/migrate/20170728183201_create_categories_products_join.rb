class CreateCategoriesProductsJoin < ActiveRecord::Migration[5.1]
  def change
    create_table :products_categories, id: false do |t|
      t.belongs_to :product, index: true
      t.belongs_to :category, index: true
    end
  end
end
