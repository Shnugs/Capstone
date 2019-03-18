class Simulation < ApplicationRecord
  belongs_to :character, optional: true
  has_one :user, through: :characters
  has_many :battle_clusters
  has_many :battles, through: :battle_clusters

  def run_simulation(hero, villain_array, n_times)
    villain_array.each do |villain|
      cluster = BattleCluster.create
      cluster.simulation_id = id
      cluster.run_battle_cluster(hero, villain, n_times)
      if cluster.save
        puts "Successfully saved Battle Cluster"
      else
        puts "Failed to save Battle Cluster"
      end
      cluster.simulation_id = id
    end
  end
end
