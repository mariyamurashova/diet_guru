class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :date_of_birth
      t.float :current_weight
      t.float :target_weight

      t.timestamps
    end
  end
end
