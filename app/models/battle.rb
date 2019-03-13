class Battle < ApplicationRecord
  belongs_to :battles_cluster

  def initialize(hero, villain)
    @hero = hero
    @villain = villain
  end

  def set_turn_order
    hero_init = @hero.roll_initiative
    villain_init = @villain.roll_initiative

    if hero_init > villain_init
      return [@hero, @villain]
    elsif villain_init > hero_init
      return [@villain, @hero]
    elsif hero_init == villain_init
      if @hero.initiative > @villain.initiative
        return [@hero, @villain]
      elsif @villain.initiative > @hero.initiative
        return [@villain, @hero]
      else
        set_turn_order
      end
    end
  end

  def run
    attacker, defender = set_turn_order
    until @hero.dead? || @villain.dead?
      # TODO - The 2 here should become a variable representing the number of attacks the attacker gets per turn. 
      # For now, this represents their standard attack + bonus attack. 
      2.times do 
        damage = 0
        attack = attacker.to_hit(defender)
        if attack['hit'] == true
          if attack['crit'] == true
            damage = attacker.calc_dmg({crit: true, dmg: attacker.weapon_1_dmg}) # TODO - Change to be a random weapon for testing
          end
          damage = attacker.calc_dmg({crit: false, dmg: attacker.weapon_1_dmg}) # Same as above ^
        end
        defender.assign_dmg(damage)
      end
      attacker, defender = defender, attacker
    end
    p "Hero HP: #{@hero.hp}"
    p "Villain HP: #{@villain.hp}"
  end
end
