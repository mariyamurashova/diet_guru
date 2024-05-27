class CreateDishes < ActiveRecord::Migration[7.1]
  def change
    create_table :dishes do |t|
      t.string :title
      t.integer :number_of_servings

      t.timestamps
    end
  end
end
