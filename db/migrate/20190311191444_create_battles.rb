class CreateBattles < ActiveRecord::Migration[5.2]
  def change
    create_table :battles do |t|
      t.boolean :win
      t.boolean :win_initiative
      t.integer :dmg_taken
      t.integer :dmg_dealt
      t.integer :turns
      t.integer :hits
      t.integer :misses
      t.integer :crits
      t.decimal :atk_1_rate, precision: 3, scale: 2
      t.decimal :atk_2_rate, precision: 3, scale: 2
      t.decimal :atk_3_rate, precision: 3, scale: 2

      t.timestamps
    end
  end
end
