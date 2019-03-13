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
    elsif base + weapon_1_attack >= op_stats.armor_class
      return {crit: false, hit: true}
    end
    {crit: false, hit: false}
  end

  def calc_dmg(dmg_params)
    rolls = dmg_params['dmg'][0...(/d|D/ =~ dmg_params['dmg'])].to_i
    if damage_params['crit']
      rolls *= 2
    end
    die = dmg_params['dmg'][((/d|D/ =~ dmg_params['dmg']) + 1)...(/\+|\-/ =~ dmg_params['dmg'])].to_i
    mod = dmg_params['dmg'][((/\+|\-/ =~ dmg_params['dmg']) + 1), dmg_params['dmg'].length].to_i
    sign = dmg_params['dmg'][/\+|\-/ =~ dmg_params['dmg']]
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

  def assign_dmg(dmg)
    hp -= dmg
  end

  def dead?
    if hp <= 0
      return true
    end
    return false
  end
end
