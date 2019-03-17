class Simulation < ApplicationRecord
  belongs_to :character, optional: true
  has_one :user, through: :characters
  has_many :battle_clusters
  has_many :battles, through: :battle_clusters

  def run_simulation(hero, villains_array, n_times)
    villains_array.each do |villain|
      cluster = BattleCluster.new.run_battle_cluster(hero, villain, n_times)
      cluster.simulation_id = id
      if cluster.save
        puts "Successfully saved the Battle Cluster"
      else
        puts "Failed to save Battle Cluster"
      end
    end
  end
end
