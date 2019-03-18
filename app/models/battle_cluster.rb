class BattleCluster < ApplicationRecord
  belongs_to :simulation, optional: true
  has_many :battles 
  has_one :opponent

  def run_battle_cluster(hero, villain, n_times)
    n_times.times do 
      self.opponent_id = villain.id
      new_battle = Battle.new
      new_battle.battle_cluster_id = id 
      new_battle.run_battle(hero, villain)
      # TODO - Collect data from all battles and fill out the other BattleCluster columns
      if new_battle.save
        puts "Successfully saved Battle"
      else
        puts "Failed to save Battle"
      end
      new_battle.battle_cluster_id = id
    end
  end

end
