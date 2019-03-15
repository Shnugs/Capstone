class Character < ApplicationRecord
  belongs_to :user, optional: true
  has_many :simulations
  has_many :battle_clusters, through: :simulations
  has_many :battles, through: :battle_clusters

  def roll(d)
    rand(1..d)
  end

  def roll_initiative
    initiative + roll(20)
  end

  def to_hit(opponent_stats)
    base = roll(20)
    if base == 20
      return {crit: true, hit: true}
    elsif base + weapon_1_attack >= opponent_stats.armor_class
      return {crit: false, hit: true}
    end
    {crit: false, hit: false}
  end

  def calc_dmg(params)
    # {crit: true, dmg: attacker.weapon_1_dmg}
    rolls = params[:dmg][0...(/d|D/ =~ params[:dmg])].to_i
    if params[:crit]
      rolls *= 2
    end
    die = params[:dmg][((/d|D/ =~ params[:dmg]) + 1)...(/\+|\-/ =~ params[:dmg])].to_i
    mod = params[:dmg][((/\+|\-/ =~ params[:dmg]) + 1), params[:dmg].length].to_i
    sign = params[:dmg][/\+|\-/ =~ params[:dmg]]
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
    self.hp -= dmg
  end

  def dead?
    hp <= 0
  end
end
