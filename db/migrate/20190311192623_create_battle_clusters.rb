class CreateBattleClusters < ActiveRecord::Migration[5.2]
  def change
    create_table :battle_clusters do |t|
      t.integer :opponant_id
      t.integer :simulation_id
      t.decimal :win_rate, precision: 3, scale: 2
      t.decimal :initiative_rate, precision: 3, scale: 2
      t.decimal :avg_dmg_taken, precision: 3, scale: 2
      t.decimal :avg_dmg_dealt, precision: 3, scale: 2
      t.decimal :avg_dmg_taken_per_turn, precision: 3, scale: 2
      t.decimal :avg_dmg_dealt_per_turn, precision: 3, scale: 2
      t.decimal :avg_turns, precision: 3, scale: 2
      t.decimal :hit_rate, precision: 3, scale: 2
      t.decimal :crit_rate, precision: 3, scale: 2

      t.timestamps
    end
  end
end
