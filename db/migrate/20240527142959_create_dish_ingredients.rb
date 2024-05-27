class CreateDishIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :dish_ingredients do |t|
      t.float :weight
      t.references :dish, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
