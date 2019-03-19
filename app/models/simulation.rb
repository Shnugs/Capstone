class Simulation < ApplicationRecord
  # TODO - Add trial_size to battle_cluster table
  belongs_to :character, optional: true
  has_one :user, through: :characters
  has_many :battle_clusters
  has_many :battles, through: :battle_clusters

  def run_simulation(hero, villain_array, n_times)
    villain_array.each do |villain|
      cluster = BattleCluster.create
      cluster.simulation_id = id
      cluster.run_battle_cluster(hero, villain, n_times)
      total_wins = 0.0
      total_initiative_wins = 0.0
      total_dmg_taken = 0.0
      total_dmg_dealt = 0.0
      total_turns = 0.0
      total_hits = 0.0
      total_misses = 0.0
      total_crits = 0.0
      cluster.battles.each do |battle|
        total_wins += 1 if battle.win
        total_initiative_wins += 1 if battle.win_initiative
        total_dmg_taken += battle.dmg_taken
        total_dmg_dealt += battle.dmg_dealt
        total_turns += battle.turns 
        total_hits += battle.hits 
        total_misses += battle.misses 
        total_crits += battle.crits 
      end
      cluster.win_rate = ((total_wins / n_times) * 100)
      cluster.initiative_rate = ((total_initiative_wins / n_times) * 100)
      cluster.avg_dmg_dealt = total_dmg_dealt / n_times
      cluster.avg_dmg_taken = total_dmg_taken / n_times
      cluster.avg_dmg_taken_per_turn = cluster.avg_dmg_taken / total_turns
      cluster.avg_dmg_dealt_per_turn = cluster.avg_dmg_dealt / total_turns
      cluster.avg_turns = total_turns / n_times
      cluster.hit_rate = (total_hits / (total_hits + total_misses) * 100)
      cluster.crit_rate = (total_crits / (total_hits + total_misses) * 100)

      if cluster.save
        puts "Successfully saved Battle Cluster"
      else
        puts "Failed to save Battle Cluster"
      end
      cluster.simulation_id = id
    end
  end
end

# win_rate
# initiative_rate
# avg_dmg_taken
# avg_dmg_dealt
# avg_dmg_taken_per_turn
# avg_dmg_dealt_per_turn
# avg_turns
# hit_rate
# crit_rate

