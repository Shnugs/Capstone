class Character < ApplicationRecord
  belongs_to :user
  has_many :simulations

  def roll(d)
    rand(1..d)
  end

  def roll_initiative
    initiative + roll(20)
  end

  def to_hit(op_stats)
    base = roll(20)
    if base == 20
      return {crit: true, hit: true}
    elsif base + weapon_1_attack >= op_stats['armor_class']
      return {crit: false, hit: true}
    end
    {crit: false, hit: false}
  end

  def calc_dmg(dmg)
    rolls = dmg[0...(/d|D/ =~ dmg)].to_i
    die = dmg[((/d|D/ =~ dmg) + 1)...(/\+|\-/ =~ dmg)].to_i
    mod = dmg[((/\+|\-/ =~ dmg) + 1), dmg.length].to_i
    sign = dmg[/\+|\-/ =~ dmg]
    total = 0
    rolls.times do 
      var_dmg = rand(1..die)
      if sign == "+"
        composite_total = var_dmg + mod
      elsif sign == "-"
        composite_total = var_dmg - mod
      end
      if composite_total < 0
        composite_total = 0
      end
      total += composite_total
    end
    total
  end

  def assign_dmg(damage_params)
    if damage_params['hit']
      if damage_params['crit']
        damage_params['dmg']
      else
        damage_params['dmg']
      end
    end
  end

  def dead?
    if hp <= 0
      return true
    end
    return false
  end
end
