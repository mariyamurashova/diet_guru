class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :date
      t.float :current_weight
      t.float :target_weight

      t.timestamps
    end
  end
end
