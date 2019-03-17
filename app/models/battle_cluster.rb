class BattleCluster < ApplicationRecord
  belongs_to :simulation, optional: true
  has_many :battles 
  has_one :opponent

  def run_battle_cluster(hero, villain, n_times)
    n_times.times do 
      self.opponent_id = villain.id
      new_battle = Battle.new.run_battle(hero, villain)
      if new_battle.save
        puts "Successfully saved new Battle"
      else
        puts "Failed to save Battle"
      end
    end
  end

end
