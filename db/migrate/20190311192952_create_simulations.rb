class CreateSimulations < ActiveRecord::Migration[5.2]
  def change
    create_table :simulations do |t|
      t.integer :character_id

      t.timestamps
    end
  end
end
