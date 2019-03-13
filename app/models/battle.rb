class Battle < ApplicationRecord
  belongs_to :battles_cluster

  def initialize(hero, villain)
    @hero = hero
    @villain = villain
  end

  def run
    @hero.initiative
    until hero.dead? || villain.dead? 
  end
end
