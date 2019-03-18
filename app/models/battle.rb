class Battle < ApplicationRecord
  belongs_to :battle_cluster, optional: true
  has_one :simulation, through: :battle_cluster
  has_one :character, through: :simulation
  has_one :user, through: :character

  has_one :opponent, through: :battle_cluster, source: :opponent

  def set_turn_order(hero, villain)
    while true
      hero_init = hero.roll_initiative
      villain_init = villain.roll_initiative

      if hero_init > villain_init
        self.win_initiative = true 
        return [hero, villain]
      elsif villain_init > hero_init
        self.win_initiative = false
        return [villain, hero]
      elsif hero_init == villain_init
        if hero.initiative > villain.initiative
          self.win_initiative = true
          return [hero, villain]
        elsif villain.initiative > hero.initiative
          self.win_initiative = false
          return [villain, hero]
        end
      end
    end
  end

  def run_battle(hero, villain)
    hero = Marshal.load(Marshal.dump(hero))
    villain = Marshal.load(Marshal.dump(villain))
    
    attacker, defender = set_turn_order(hero, villain)
    until hero.dead? || villain.dead?
      # TODO - The '2' here should become a variable representing the number of attacks each attacker gets per turn. 
      # For now, this represents their standard attack + bonus attack. 
      2.times do 
        attack = attacker.to_hit(defender)
        if attack[:hit] == true
          self.hits += 1 if attacker == hero 
          if attack[:crit] == true
            self.crits += 1 if attacker == hero 
            damage = attacker.calc_dmg({crit: true, dmg: attacker.weapon_1_dmg}) # TODO - Change to be a random weapon for testing
          elsif attack[:crit] == false
            damage = attacker.calc_dmg({crit: false, dmg: attacker.weapon_1_dmg}) # Same as above ^
          end
        else
          self.misses += 1 if attacker == hero 
          damage = 0
        end
        self.dmg_dealt += damage if attacker == hero
        self.dmg_taken += damage if attacker == villain
        defender.assign_dmg(damage)
      end
      self.turns += 1 if attacker == hero 
      attacker, defender = defender, attacker
    end
    self.win = hero.hp > 0
  end
end