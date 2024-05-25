class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :brand_name
      t.integer :calorie
      t.integer :protein
      t.integer :fat
      t.integer :carbohydrate

      t.timestamps
    end
  end
end
